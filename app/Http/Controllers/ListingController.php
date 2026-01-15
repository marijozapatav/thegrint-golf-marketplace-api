<?php

namespace App\Http\Controllers;

use App\Core\Services\ListingService;
use App\Http\Resources\ListingResource;
use Illuminate\Http\Request;

class ListingController extends Controller
{
    protected $listingService;

    public function __construct(ListingService $listingService)
    {
        $this->listingService = $listingService;
    }

    
     
    public function index(Request $request)
    {
        $filters = $request->only(['min_price', 'max_price', 'category_id', 'condition', 'show_all', 'keywords']);
        
        $listings = $this->listingService->getAllListings($filters);

        return ListingResource::collection($listings);
    }

    
    public function store(Request $request)
    {
        $validated = $request->validate([
            'title'       => 'required|regex:/^[a-zA-Z\s]+$/', 
            'price'       => 'required|numeric|min:0',
            'condition'   => 'required|in:New,Used,Refurbished,Like New',
            'category_id' => 'required|exists:categories,id',
            'description' => 'nullable|string',
            'end_date'    => 'required|date|after:today',
        ]);

        $listing = $this->listingService->createListing($validated, $request->user()->id);

        return (new ListingResource($listing))
                ->additional(['message' => 'Listing created successfully'])
                ->response()
                ->setStatusCode(201);
    }

    
    public function destroy(Request $request, $id)
    {
        $this->listingService->cancelListing((int)$id, $request->user()->id);

        return response()->json(['message' => 'Listing deleted successfully'], 200);
    }
}
