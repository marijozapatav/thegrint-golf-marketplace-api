<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AuthController extends Controller
{
    public function login(Request $request) {
    $request->validate(['email' => 'required|email', 'password' => 'required']);
    
    $user = \App\Models\User::where('email', $request->email)->first();

    if (!$user) return response()->json(['message' => 'User not found'], 401);

        return response()->json([
         'access_token' => $user->createToken('auth_token')->plainTextToken,
            'token_type' => 'Bearer',
    ]);
}
}
