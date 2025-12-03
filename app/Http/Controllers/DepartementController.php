<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Departement;

class DepartementController extends Controller
{
    public function index()
    {
        return Departement::all();
    }

    public function store(Request $request)
    {
        $request->validate([
            'nama' => 'required|string|max:255',
            'kode' => 'required|string|max:10|unique:departement,kode',
        ]);

        return Departement::create($request->all());
    }

    public function update(Request $request, $id)
    {
        $dept = Departement::findOrFail($id);
        
        $request->validate([
            'nama' => 'sometimes|required|string|max:255',
            'kode' => 'sometimes|required|string|max:10|unique:departement,kode,' . $id . ',id_departement',
        ]);
        
        $dept->update($request->all());
        return $dept;
    }

    public function destroy($id)
    {
        Departement::destroy($id);
        return response()->json(['message' => 'Deleted']);
    }
}