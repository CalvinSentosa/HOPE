<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use OpenAI\Laravel\Facades\OpenAI;

class GptController extends Controller
{
    public function chat(Request $request)
{
    $messages = [
        ['role' => 'system', 'content' => 'You are a psychologist named Dr. HIRO. You provide emotional and psychological support to users.'],
        ['role' => 'user', 'content' => $request->input('message')],
    ];

    $result = OpenAI::chat()->create([
        'model' => 'gpt-3.5-turbo',
        'messages' => $messages,
    ]);

    return response()->json($result->choices[0]->message->content);
}

}