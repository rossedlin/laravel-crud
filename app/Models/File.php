<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @property string $filename
 * @property string $mime_type
 * @property mixed  $file
 */
class File extends Model
{
    use HasFactory;
}
