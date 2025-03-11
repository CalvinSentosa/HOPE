<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use OpenAI\Laravel\Facades\OpenAI;

class GptController extends Controller
{
    public function chat(Request $request)
    {

        $result = OpenAI::chat()->create([
            'model' => 'gpt-3.5-turbo',
            'messages' => [
                ['role' => 'user', 'content' => $request->input('message')],
            ],
        ]);
        return response()->json($result->choices[0]->message->content);
    }
}