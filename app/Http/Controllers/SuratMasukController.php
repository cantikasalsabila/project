<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SuratMasuk;

class SuratMasukController extends Controller
{

    private function normalizeJenisSurat($id_jenissurat)
    {
        if (in_array($id_jenissurat, [8, 9])) {
            return [8, 9];
        }
        return [$id_jenissurat];
    }

    private function getLastNumber($id_departement, $id_jenissurat, $tahun)
    {
        $jenisIds = $this->normalizeJenisSurat($id_jenissurat);
        $surats = SuratMasuk::where('id_departement', $id_departement)
                          ->whereIn('id_jenissurat', $jenisIds)
                          ->whereYear('tanggal_surat', $tahun)
                          ->get();
        
        if ($surats->isEmpty()) {
            return 0;
        }
        
        $maxNumber = 0;
        
        foreach ($surats as $surat) {
            if ($surat->nomor_surat) {
                $parts = explode('/', $surat->nomor_surat);
                
                if (!empty($parts)) {
                    if (in_array($id_jenissurat, [8, 9]) && strpos($parts[0], 'GAM-') === 0) {
                        $number = intval(end($parts));
                        if ($number > $maxNumber) {
                            $maxNumber = $number;
                        }
                    } 
                    elseif ($id_jenissurat == 1) {
                        $firstPart = $parts[0];
                        $beforeDot = explode('.', $firstPart)[0];
                        $number = intval($beforeDot);
                        if ($number > $maxNumber) {
                            $maxNumber = $number;
                        }
                    }
                    else {
                        $firstPart = $parts[0];
                        $number = intval($firstPart);
                        if ($number > $maxNumber) {
                            $maxNumber = $number;
                        }
                    }
                }
            }
        }
        
        return $maxNumber;
    }

    public function index(Request $request)
    {
        $query = SuratMasuk::with(['departement', 'jenissurat']);
        
        if ($request->has('id_departement')) {
            $query->where('id_departement', $request->id_departement);
        }
        
        if ($request->has('id_jenissurat')) {
            $jenisIds = $this->normalizeJenisSurat($request->id_jenissurat);
            $query->whereIn('id_jenissurat', $jenisIds);
        }
      
        if ($request->has('tahun')) {
            $query->whereYear('tanggal_surat', $request->tahun);
        }
        
        return $query->orderBy('created_at', 'desc')->get();
    }

    public function store(Request $request)
    {
        $request->validate([
            'tanggal_surat' => 'required|date',
            'tujuan' => 'required',
            'pengirim' => 'required',
            'penerima' => 'required',
            'perihal' => 'required',
            'id_departement' => 'required|exists:departement,id_departement',
            'id_jenissurat' => 'required|exists:jenissurat,id_jenissurat',
            'file' => 'nullable|file|mimes:pdf,doc,docx,jpg,jpeg,png|max:10240' 
        ]);

        $departemen = \App\Models\Departement::find($request->id_departement);
        $jenisSurat = \App\Models\JenisSurat::find($request->id_jenissurat);

        if (!$departemen || !$jenisSurat) {
            return response()->json(['error' => 'Departemen atau Jenis Surat tidak ditemukan'], 404);
        }

        $kodeDept = strtoupper($departemen->kode ?? 'DEPT');
        $kodeJenis = strtoupper($jenisSurat->kode);

      
        $tahunSurat = date('Y', strtotime($request->tanggal_surat));
        $bulanSurat = date('m', strtotime($request->tanggal_surat));
        
      
        $lastNumber = $this->getLastNumber($request->id_departement, $request->id_jenissurat, $tahunSurat);
        $nextNumber = $lastNumber + 1;
        $nomor = str_pad($nextNumber, 3, '0', STR_PAD_LEFT);

        $pt = "GAM";

        $bulan = [
            1=>"I",2=>"II",3=>"III",4=>"IV",5=>"V",6=>"VI",
            7=>"VII",8=>"VIII",9=>"IX",10=>"X",11=>"XI",12=>"XII"
        ];
        $bulanRomawi = $bulan[intval($bulanSurat)];

      
        if ($request->id_jenissurat == 1) {
            $nomorSurat = "$nomor.$kodeJenis/$pt-$kodeDept/$bulanRomawi/$tahunSurat";
        } elseif (in_array($request->id_jenissurat, [8, 9])) {
            $nomorSurat = "$pt-$kodeJenis/$tahunSurat/$kodeDept/$bulanRomawi/$nomor";
        } else {
            $nomorSurat = "$nomor/$pt-$kodeDept/$kodeJenis/$bulanRomawi/$tahunSurat";
        }

        $fileName = null;
        if ($request->hasFile('file')) {
            $file = $request->file('file');
            
            $uploadPath = public_path('uploads');
            if (!file_exists($uploadPath)) {
                mkdir($uploadPath, 0777, true);
            }
          
            $fileName = time() . '_' . preg_replace('/[^a-zA-Z0-9._-]/', '', $file->getClientOriginalName());
            
            try {
                $file->move($uploadPath, $fileName);
            } catch (\Exception $e) {
                return response()->json([
                    'error' => 'Gagal upload file',
                    'message' => $e->getMessage()
                ], 500);
            }
        }

        try {
            $surat = SuratMasuk::create([
                'nomor_surat' => $nomorSurat,
                'tanggal_surat' => $request->tanggal_surat,
                'tujuan' => $request->tujuan,
                'pengirim' => $request->pengirim,
                'penerima' => $request->penerima,
                'perihal' => $request->perihal,
                'id_departement' => $request->id_departement,
                'id_jenissurat' => $request->id_jenissurat,
                'keterangan' => $request->keterangan,
                'file' => $fileName,
            ]);

            return response()->json([
                'message' => 'Surat berhasil ditambahkan',
                'data' => $surat
            ], 201);
        } catch (\Exception $e) {
         
            if ($fileName && file_exists(public_path('uploads/' . $fileName))) {
                unlink(public_path('uploads/' . $fileName));
            }
            
            return response()->json([
                'error' => 'Gagal menyimpan surat',
                'message' => $e->getMessage()
            ], 500);
        }
    }

    public function show($id)
    {
        return SuratMasuk::with(['departement', 'jenissurat'])->findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $surat = SuratMasuk::findOrFail($id);
        
        $request->validate([
            'tanggal_surat' => 'required|date',
            'tujuan' => 'required',
            'pengirim' => 'required',
            'penerima' => 'required',
            'perihal' => 'required',
            'file' => 'nullable|file|mimes:pdf,doc,docx,jpg,jpeg,png|max:10240' 
        ]);

        $updateData = [
            'tanggal_surat' => $request->tanggal_surat,
            'tujuan' => $request->tujuan,
            'pengirim' => $request->pengirim,
            'penerima' => $request->penerima,
            'perihal' => $request->perihal,
            'keterangan' => $request->keterangan,
        ];

        if ($request->hasFile('file')) {
            $file = $request->file('file');

            $uploadPath = public_path('uploads');
            if (!file_exists($uploadPath)) {
                mkdir($uploadPath, 0777, true);
            }

            if ($surat->file && file_exists(public_path('uploads/' . $surat->file))) {
                try {
                    unlink(public_path('uploads/' . $surat->file));
                } catch (\Exception $e) {
                    \Log::warning('Gagal menghapus file lama: ' . $e->getMessage());
                }
            }

            $fileName = time() . '_' . preg_replace('/[^a-zA-Z0-9._-]/', '', $file->getClientOriginalName());
            
            try {
                $file->move($uploadPath, $fileName);
                $updateData['file'] = $fileName;
            } catch (\Exception $e) {
                return response()->json([
                    'error' => 'Gagal upload file',
                    'message' => $e->getMessage()
                ], 500);
            }
        }

        $surat->update($updateData);
        
        return response()->json([
            'message' => 'Surat berhasil diupdate',
            'data' => $surat->fresh()
        ]);
    }

    public function destroy($id)
    {
        $surat = SuratMasuk::findOrFail($id);

        if ($surat->file && file_exists(public_path('uploads/' . $surat->file))) {
            unlink(public_path('uploads/' . $surat->file));
        }
        
        $surat->delete();
        
        return response()->json(['message' => 'Surat berhasil dihapus']);
    }

    public function nomorTerbaru(Request $request)
    {
        $request->validate([
            'tanggal_surat' => 'required|date',
            'id_departement' => 'required|exists:departement,id_departement',
            'id_jenissurat' => 'required|exists:jenissurat,id_jenissurat',
        ]);

        $idDept = $request->id_departement;
        $idJenis = $request->id_jenissurat;
        $tanggalSurat = $request->tanggal_surat;

        $departemen = \App\Models\Departement::find($idDept);
        $jenisSurat = \App\Models\JenisSurat::find($idJenis);

        if (!$departemen || !$jenisSurat) {
            return response()->json(['error' => 'Data tidak ditemukan'], 404);
        }

        $kodeDept = strtoupper($departemen->kode ?? 'DEPT');
        $kodeJenis = strtoupper($jenisSurat->kode);

      
        $tahunSurat = date('Y', strtotime($tanggalSurat));
        $bulanSurat = date('m', strtotime($tanggalSurat));
        
        
        $lastNumber = $this->getLastNumber($idDept, $idJenis, $tahunSurat);
        $nextNumber = $lastNumber + 1;
        $nomor = str_pad($nextNumber, 3, '0', STR_PAD_LEFT);

        $pt = "GAM";

        $bulan = [
            1=>"I",2=>"II",3=>"III",4=>"IV",5=>"V",6=>"VI",
            7=>"VII",8=>"VIII",9=>"IX",10=>"X",11=>"XI",12=>"XII"
        ];
        $bulanRomawi = $bulan[intval($bulanSurat)];

        
        if ($idJenis == 1) {
            $nomorSurat = "$nomor.$kodeJenis/$pt-$kodeDept/$bulanRomawi/$tahunSurat";
        } elseif (in_array($idJenis, [8, 9])) {
            $nomorSurat = "$pt-$kodeJenis/$tahunSurat/$kodeDept/$bulanRomawi/$nomor";
        } else {
            $nomorSurat = "$nomor/$pt-$kodeDept/$kodeJenis/$bulanRomawi/$tahunSurat";
        }
        
        return response()->json([
            'nomor_surat' => $nomorSurat,
            'nomor_urut' => $nextNumber,
            'tahun' => $tahunSurat
        ]);
    }
}