<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class JenisSurat extends Model
{
    use HasFactory;

    protected $table = 'jenissurat';

    protected $primaryKey = 'id_jenissurat';
    public $timestamps = false;

    protected $fillable = ['nama', 'kode'];

    protected $appends = ['id'];

    public function getIdAttribute()
    {
        return $this->id_jenissurat;
    }

    public function suratMasuks()
    {
        return $this->hasMany(SuratMasuk::class, 'id_jenissurat');
    }
}
