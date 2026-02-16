<?php

namespace App\Core\Services;

use App\Models\Listing;
use Illuminate\Support\Facades\Http;
use Exception;
use Illuminate\Support\Facades\Log;

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
   
    $results = ['evaluation' => 'N/A', 'market_value' => 0];

    try {
        $apiKey = env('GEMINI_API_KEY');
        $url = "https://generativelanguage.googleapis.com/v1/models/gemini-2.5-flash:generateContent?key=" . $apiKey;
        
        
         $prompt = "You are a golf equipment expert. Analyze: '$title' in '$condition' condition. 
         Respond strictly in JSON format with exactly two fields: 'evaluation'
          (a detailed technical paragraph) and 'market_value' (an estimated decimal number in USD).";

            $response = Http::post($url, [
                'contents' => [
                    [
                        'parts' => [
                            ['text' => $prompt]
                        ]
                    ]
                ]
            ]);

        $data = $response->json();
        $aiText = $data['candidates'][0]['content']['parts'][0]['text'];

     
        preg_match('/\{.*\}/s', $aiText, $matches);
        $jsonOnly = $matches[0] ?? null;

        if ($jsonOnly) {
            $aiData = json_decode($jsonOnly, true);
            $results['evaluation'] = $aiData['evaluation'] ?? 'N/A';
            $results['market_value'] = $aiData['market_value'] ?? 0;
        }
    } catch (\Exception $e) {
        Log::error("Error IA: " . $e->getMessage());
    }

   
    return $results;
}
}