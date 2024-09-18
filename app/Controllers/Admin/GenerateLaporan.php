<?php

namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use CodeIgniter\I18n\Time;
use DateTime;
use DateInterval;
use DatePeriod;

use App\Models\SiswaModel;
use App\Models\KelasModel;
use App\Models\PresensiSiswaModel;

class GenerateLaporan extends BaseController
{
   protected SiswaModel $siswaModel;
   protected KelasModel $kelasModel;
   protected PresensiSiswaModel $presensiSiswaModel;

   public function __construct()
   {
      $this->siswaModel = new SiswaModel();
      $this->kelasModel = new KelasModel();
      $this->presensiSiswaModel = new PresensiSiswaModel();
   }

   public function index()
   {
      $kelas = $this->kelasModel->getAllKelas();
      $siswaPerKelas = [];

      foreach ($kelas as $value) {
         array_push($siswaPerKelas, $this->siswaModel->getSiswaByKelas($value['id_kelas']));
      }

      $data = [
         'title' => 'Generate Laporan',
         'ctx' => 'laporan',
         'siswaPerKelas' => $siswaPerKelas,
         'kelas' => $kelas
      ];

      return view('admin/generate-laporan/generate-laporan', $data);
   }

   public function generateLaporanSiswa()
   {
      $idKelas = $this->request->getVar('kelas');
      $siswa = $this->siswaModel->getSiswaByKelas($idKelas);
      $type = $this->request->getVar('type');

      if (empty($siswa)) {
         session()->setFlashdata([
            'msg' => 'Data siswa kosong!',
            'error' => true
         ]);
         return redirect()->to('/admin/laporan');
      }

      $kelas = $this->kelasModel->where(['id_kelas' => $idKelas])->join('tb_jurusan', 'tb_kelas.id_jurusan = tb_jurusan.id', 'left')->first();

      $bulan = $this->request->getVar('tanggalSiswa');

      $begin = new DateTime($bulan);
      $end = (new DateTime($begin->format('Y-m-t')))->modify('+1 day');
      $interval = DateInterval::createFromDateString('1 day');
      $period = new DatePeriod($begin, $interval, $end);

      $arrayTanggal = [];
      $dataAbsen = [];

      foreach ($period as $value) {
         if (!($value->format('D') == 'Sat' || $value->format('D') == 'Sun')) {
            $lewat = Time::parse($value->format('Y-m-d'))->isAfter(Time::today());

            $absenByTanggal = $this->presensiSiswaModel
               ->getPresensiByKelasTanggal($idKelas, $value->format('Y-m-d'));

            $absenByTanggal['lewat'] = $lewat;

            array_push($dataAbsen, $absenByTanggal);
            array_push($arrayTanggal, $value);
         }
      }

      $laki = 0;

      foreach ($siswa as $value) {
         if ($value['jenis_kelamin'] != 'Perempuan') {
            $laki++;
         }
      }

      $data = [
         'tanggal' => $arrayTanggal,
         'bulan' => $begin->format('F'),
         'listAbsen' => $dataAbsen,
         'listSiswa' => $siswa,
         'jumlahSiswa' => [
            'laki' => $laki,
            'perempuan' => count($siswa) - $laki
         ],
         'kelas' => $kelas,
         'grup' => "kelas " . $kelas['kelas'] . " " . $kelas['jurusan']
      ];

      if ($type == 'doc') {
         $this->response->setHeader('Content-type', 'application/vnd.ms-word');
         $this->response->setHeader('Content-Disposition', 'attachment;Filename=laporan_absen_' . $kelas['kelas'] . " " . $kelas['jurusan'] . '_' . $begin->format('F-Y') . '.doc');

         return view('admin/generate-laporan/laporan-siswa', $data);
      }

      return view('admin/generate-laporan/laporan-siswa', $data) . view('admin/generate-laporan/topdf');
   }
}

