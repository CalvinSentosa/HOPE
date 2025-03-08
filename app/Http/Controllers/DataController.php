<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;

class DataController extends Controller
{
    public function data()
    {
        $items = User::all();
        if ($items->isEmpty()) {
            return response()->json([
                'message' => 'No users found',
                'data' => []
            ], 200);
        }

        return response()->json([
            'message' => 'Users retrieved successfully',
            'data' => $items
        ], 200);



    }
}
