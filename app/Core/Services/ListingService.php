<?php

namespace App\Core\Services;

use App\Models\Listing;
use Illuminate\Support\Facades\Http;
use Exception;

class ListingService
{
    
     // Listados con filtros 
     
    public function getAllListings(array $filters)
    {
        $query = Listing::with(['user', 'category']);

        // 1. Filtro Booleano "Show All"
        $showAll = filter_var($filters['show_all'] ?? false, FILTER_VALIDATE_BOOLEAN);

        if (!$showAll) {
            $query->where('end_date', '>=', now())
                  ->orderBy('created_at', 'asc');
        } else {
            $query->orderBy('price', 'desc');
        }

        // 2. Filtros de Rango de Precio
        if (!empty($filters['min_price'])) {
            $query->where('price', '>=', $filters['min_price']);
        }
        if (!empty($filters['max_price'])) {
            $query->where('price', '<=', $filters['max_price']);
        }

        // 3. Filtros de Categoría y Condición
        if (!empty($filters['category_id'])) {
            $query->where('category_id', $filters['category_id']);
        }
        if (!empty($filters['condition'])) {
            $query->where('condition', $filters['condition']);
        }

        // 4. Búsqueda por Keywords (Título o Descripción)
       if (!empty($filters['keywords'])) {
            $word = $filters['keywords'];
            $query->where(function($q) use ($word) {
            $q->where('title', 'LIKE', "%{$word}%")
          ->orWhere('description', 'LIKE', "%{$word}%");
    });
}

        return $query->get();
    }

    
     // Anuncio enriqueciéndo con IA de Gemini.
     
    public function createListing(array $data, int $userId)
    {
       
        $aiData = $this->enrichWithAI($data['title'], $data['condition']);

        return Listing::create(array_merge($data, [
            'user_id'         => $userId,
            'ai_evaluation'   => $aiData['evaluation'] ?? 'N/A',
            'ai_market_value' => $aiData['market_value'] ?? 0,
        ]));
    }

    
    public function cancelListing(int $id, int $userId)
    {
        $listing = Listing::where('id', $id)->where('user_id', $userId)->firstOrFail();

        return $listing->delete();
    }

   
     // Conexión externa con el proveedor de IA (Gemini)
  
  private function enrichWithAI($title, $condition)
    {
        try {
            $apiKey = env('GEMINI_API_KEY');
            $url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=" . $apiKey;

            $prompt = "Eres un experto en golf. Analiza: '$title' en condición '$condition'. 
                       Responde estrictamente en formato JSON con dos campos: 
                       'evaluation' (un párrafo técnico) y 'market_value' (un número decimal estimado en USD).";

            $response = Http::post($url, [
                'contents' => [
                    [
                        'parts' => [
                            ['text' => $prompt]
                        ]
                    ]
                ]
            ]);

            if ($response->failed()) {
                throw new Exception("AI Provider error");
            }

            $data = $response->json();
            $aiText = $data['candidates'][0]['content']['parts'][0]['text'];
            
            
            $cleanJson = preg_replace('/^```json|```$/m', '', $aiText);

            return json_decode(trim($cleanJson), true);

        } catch (Exception $e) {
            // Fail-safe: Si la IA falla
            return [
                'evaluation' => 'Evaluation pending (AI currently unavailable).',
                'market_value' => 0
            ];
        }
    }
}