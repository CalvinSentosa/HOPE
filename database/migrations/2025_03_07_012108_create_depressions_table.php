<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('depressions', function (Blueprint $table) {
            $$table->id();
            $table->integer('depression_score');
            $table->date('date_test');
            $table->string('UserEmail');
            $table->foreign('UserEmail')->references('email')->on('users');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('depressions');
    }
};
