<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;

class DataController extends Controller
{
    public function index()
    {
        $items = User::all();
        return response()->json($items);
    }
}
