<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\JenisSurat;

class JenisSuratController extends Controller
{
    public function index()
    {
        return JenisSurat::all();
    }

    public function store(Request $request)
    {
        $request->validate([
            'nama' => 'required|string|max:255',
            'kode' => 'required|string|max:10|unique:jenissurat,kode',
        ]);

        return JenisSurat::create($request->all());
    }

    public function update(Request $request, $id)
    {
        $jenis = JenisSurat::findOrFail($id);
        $jenis->update($request->all());
        return $jenis;
    }

    public function destroy($id)
    {
        JenisSurat::destroy($id);
        return response()->json(['message' => 'Deleted']);
    }
}