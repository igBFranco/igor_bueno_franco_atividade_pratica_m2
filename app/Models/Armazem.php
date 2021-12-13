<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Armazem extends Model
{
    protected $fillable = [
        'endereco'
    ];
    use HasFactory;
}
