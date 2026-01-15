<?php

use App\Http\Controllers\ListingController;
use App\Http\Controllers\AuthController;
use Illuminate\Support\Facades\Route;


Route::post('/login', [AuthController::class, 'login']);
Route::get('/listings', [ListingController::class, 'index']);


Route::middleware(['auth:sanctum', 'throttle:listings-limit'])->group(function () {
    
    
    Route::post('/listings', [ListingController::class, 'store']);

    Route::delete('/listings/{id}', [ListingController::class, 'destroy']);
    
});
