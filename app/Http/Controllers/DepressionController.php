<?php

namespace App\Http\Controllers;

use App\Models\Depression;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Http\Requests\StoreDepressionRequest;
use App\Http\Requests\UpdateDepressionRequest;
use Illuminate\Http\Request;

class DepressionController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function result(Request $req)
    {
        $rules = [
            'email' => 'required',
            'depression_score' => 'required|integer'
            
        ];
        $req->validate($rules);
        $user = User::where('email', $req->email)->first();

        Depression::create([
            'UserEmail' => $req->email,
            'depression_score' => $req->depression_score,
            'date_test' => now(),
        ]);

        return response()->json(['message' => 'Test result saved successfully']);
    }

    public function getScores(Request $request)
    {
        $email = $request->query('email');

        if (!$email) {
            return response()->json(['error' => 'Email parameter is required'], 400);
        }

        $user = User::where('email', $email)->first();

        if (!$user) {
            return response()->json(['error' => 'User not found'], 404);
        }

        $scores = Depression::where('UserEmail', $email)
            ->orderBy('date_test', 'desc')
            ->get(['depression_score as score', 'date_test as date']);

        return response()->json($scores);
    }
    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreDepressionRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Depression $depression)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Depression $depression)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateDepressionRequest $request, Depression $depression)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Depression $depression)
    {
        //
    }
}
