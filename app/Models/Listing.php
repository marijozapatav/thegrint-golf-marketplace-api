<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Listing extends Model
{
   protected $fillable = [
        'user_id', 
        'category_id', 
        'title', 
        'description', 
        'price', 
        'condition', 
        'end_date',
        'ai_evaluation',    
        'ai_market_value'
    ];

    public function category(): BelongsTo
{
    return $this->belongsTo(Category::class);
}

    public function user(): BelongsTo
{
    return $this->belongsTo(User::class);
}
}
