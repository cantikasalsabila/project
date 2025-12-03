<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SuratMasuk extends Model
{
    use HasFactory;

    protected $fillable = [
        'nomor_surat',
        'tanggal_surat',
        'tujuan',
        'pengirim',
        'penerima',
        'perihal',
        'id_departement',
        'id_jenissurat',
        'keterangan',
        'file',
    ];


    public function departement()
    {
        return $this->belongsTo(Departement::class, 'id_departement');
    }


    public function jenissurat()
    {
        return $this->belongsTo(JenisSurat::class, 'id_jenissurat');
    }
}