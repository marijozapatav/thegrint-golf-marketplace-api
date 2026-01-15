<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ListingResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id'                => $this->id,
            'title'             => $this->title,
            'price'             => $this->price,
            'ai_market_value'   => $this->ai_market_value,
            'condition'         => $this->condition,
            'description'       => $this->description,
            'end_date'          => $this->end_date,
            'created_at'        => $this->created_at->format('Y-m-d H:i:s'),
            'category_name'     => $this->category?->name, 
            'user_full_name'    => trim(($this->user?->first_name ?? '') . ' ' . ($this->user?->last_name ?? '')),
            'ai_evaluation'     => $this->ai_evaluation,
        ];
    }
}
