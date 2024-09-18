<?php

namespace App\Controllers;

use CodeIgniter\I18n\Time;
use App\Models\SiswaModel;
use App\Models\PresensiSiswaModel;
use App\Libraries\enums\TipeUser;

class Scan extends BaseController
{
   protected SiswaModel $siswaModel;
   protected PresensiSiswaModel $presensiSiswaModel;

   public function __construct()
   {
      $this->siswaModel = new SiswaModel();
      $this->presensiSiswaModel = new PresensiSiswaModel();
   }

   public function index($t = 'Masuk')
   {
      $data = ['waktu' => $t, 'title' => 'Absensi Siswa Berbasis QR Code'];
      return view('scan/scan', $data);
   }

   public function cekKode()
   {
      // ambil variabel POST
      $uniqueCode = $this->request->getVar('unique_code');
      $waktuAbsen = $this->request->getVar('waktu');

      $status = false;
      $type = TipeUser::Siswa;

      // cek data siswa di database
      $result = $this->siswaModel->cekSiswa($uniqueCode);

      if (empty($result)) {
         $status = false;
         $result = NULL;
      } else {
         $status = true;
      }

      if (!$status) { // data tidak ditemukan
         return $this->showErrorView('Data tidak ditemukan');
      }

      // jika data ditemukan
      switch ($waktuAbsen) {
         case 'masuk':
            return $this->absenMasuk($type, $result);
            break;

         case 'pulang':
            return $this->absenPulang($type, $result);
            break;

         default:
            return $this->showErrorView('Data tidak valid');
            break;
      }
   }

   public function absenMasuk($type, $result)
   {
      // data ditemukan
      $data['data'] = $result;
      $data['waktu'] = 'masuk';

      $date = Time::today()->toDateString();
      $time = Time::now()->toTimeString();

      // absen masuk
      $idSiswa = $result['id_siswa'];
      $idKelas = $result['id_kelas'];
      $data['type'] = TipeUser::Siswa;

      $sudahAbsen = $this->presensiSiswaModel->cekAbsen($idSiswa, Time::today()->toDateString());

      if ($sudahAbsen) {
         $data['presensi'] = $this->presensiSiswaModel->getPresensiById($sudahAbsen);
         return $this->showErrorView('Anda sudah absen hari ini', $data);
      }

      $this->presensiSiswaModel->absenMasuk($idSiswa, $date, $time, $idKelas);

      $data['presensi'] = $this->presensiSiswaModel->getPresensiByIdSiswaTanggal($idSiswa, $date);

      return view('scan/scan-result', $data);
   }

   public function absenPulang($type, $result)
   {
      // data ditemukan
      $data['data'] = $result;
      $data['waktu'] = 'pulang';

      $date = Time::today()->toDateString();
      $time = Time::now()->toTimeString();

      // absen pulang
      $idSiswa = $result['id_siswa'];
      $data['type'] = TipeUser::Siswa;

      $sudahAbsen = $this->presensiSiswaModel->cekAbsen($idSiswa, $date);

      if (!$sudahAbsen) {
         return $this->showErrorView('Anda belum absen hari ini', $data);
      }

      $this->presensiSiswaModel->absenKeluar($sudahAbsen, $time);

      $data['presensi'] = $this->presensiSiswaModel->getPresensiById($sudahAbsen);

      return view('scan/scan-result', $data);
   }

   public function showErrorView(string $msg = 'no error message', $data = NULL)
   {
      $errdata = $data ?? [];
      $errdata['msg'] = $msg;

      return view('scan/error-scan-result', $errdata);
   }
}
