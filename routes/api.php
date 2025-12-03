<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\SuratMasukController;
use App\Http\Controllers\DepartementController;
use App\Http\Controllers\JenisSuratController;

Route::get('/test', function () {
    return response()->json(['message' => 'API Works!']);
});

// Surat Masuk Routes
// PENTING: Route dengan path spesifik harus di atas route dengan parameter dinamis
Route::get('surat-masuk', [SuratMasukController::class, 'index']);
Route::get('surat-masuk/nomor-terbaru', [SuratMasukController::class, 'nomorTerbaru']);
Route::post('surat-masuk', [SuratMasukController::class, 'store']);
Route::get('surat-masuk/{id}', [SuratMasukController::class, 'show']);

// Support both PUT and POST with _method override
Route::put('surat-masuk/{id}', [SuratMasukController::class, 'update']);
Route::post('surat-masuk/{id}', [SuratMasukController::class, 'update']);

Route::delete('surat-masuk/{id}', [SuratMasukController::class, 'destroy']);

// Departemen Routes
Route::get('departement', [DepartementController::class, 'index']);
Route::post('departement', [DepartementController::class, 'store']);
Route::put('departement/{id}', [DepartementController::class, 'update']);
Route::post('departement/{id}', [DepartementController::class, 'update']);
Route::delete('departement/{id}', [DepartementController::class, 'destroy']);

// Jenis Surat Routes
Route::get('jenissurat', [JenisSuratController::class, 'index']);
Route::post('jenissurat', [JenisSuratController::class, 'store']);
Route::put('jenissurat/{id}', [JenisSuratController::class, 'update']);
Route::post('jenissurat/{id}', [JenisSuratController::class, 'update']);
Route::delete('jenissurat/{id}', [JenisSuratController::class, 'destroy']);