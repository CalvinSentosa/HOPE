<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Depression extends Model
{
    /** @use HasFactory<\Database\Factories\DepressionFactory> */
    use HasFactory;

    protected $table = 'depressions';

    protected $fillable =[
        'depression_score',
        'date_test',
        'UserEmail'
    ];

    public $timestamps = false;
}
