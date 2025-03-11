<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Chatbot extends Model
{
    protected $guarded=['id'];
    // protected $fillable = ['UserText','UserEmail','isUser'];
    /** @use HasFactory<\Database\Factories\ChatbotFactory> */
    use HasFactory;
}
