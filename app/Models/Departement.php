<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Departement extends Model
{
    use HasFactory;

    protected $table = 'departement';
    protected $primaryKey = 'id_departement';
    public $timestamps = false;

    protected $fillable = ['nama', 'kode'];

    protected $appends = ['id'];

    public function getIdAttribute()
    {
        return $this->id_departement;
    }

    public function suratMasuks()
    {
        return $this->hasMany(SuratMasuk::class, 'id_departement');
    }
}