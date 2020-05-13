<?php

use Restserver\Libraries\REST_Controller;

defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . 'libraries/REST_Controller.php';
require APPPATH . 'libraries/Format.php';

class Mahasiswa extends CI_Controller
{
    use REST_Controller {
        REST_Controller::__construct as private __resTraitConstruct;
    }

    function __construct()
    {
        // Construct the parent class
        parent::__construct();
        $this->__resTraitConstruct();
        $this->load->model('Mahasiswa_model', 'mahasiswa');
    }

    public function index_get()
    {
        $id = $this->get('id');

        if ($id != null) {
            $mahasiswa = $this->mahasiswa->getMahasiswa($id);
        } else {
            $mahasiswa = $this->mahasiswa->getMahasiswa();
        }

        if ($mahasiswa) {
            // Set the response and exit
            $this->response($mahasiswa, 200); // OK (200) being the HTTP response code
        } else {
            // Set the response and exit
            $this->response([
                'status' => false,
                'message' => 'User tidak ditemukan'
            ], 404); // NOT_FOUND (404) being the HTTP response code
        }
    }

    public function index_delete()
    {
        $id = $this->delete('id');

        if ($id == null) {
            $this->response([
                'status' => false,
                'message' => 'Masukkan Id User untuk menghapus'
            ], 400);
        } else {
            if ($this->mahasiswa->deleteMahasiswa($id) > 0) {
                $this->response([
                    'status' => true,
                    'message' => 'User dengan id=' . $id . ' berhasil dihapus'
                ], 200);
            } else {
                $this->response([
                    'status' => false,
                    'message' => 'User tidak ditemukan'
                ], 200);
            }
        }
    }

    public function index_post()
    {
        $nohp =  $this->post('nohp');
        $nama = $this->post('nama');
        $email =  $this->post('email');
        $jurusan =  $this->post('jurusan');
        $tgl_lahir = $this->post('tgl_lahir');
        $alamat =  $this->post('alamat');
        $password = hash("sha256", $this->post('password'));

        if (
            ($nohp != null) &&
            ($nama != null) &&
            ($jurusan != null) &&
            ($tgl_lahir != null) &&
            ($alamat != null)
        ) {
            $data = [
                'nohp' => $nohp,
                'nama' => $nama,
                'email' => $email,
                'jurusan' => $jurusan,
                'tgl_lahir' => $tgl_lahir,
                'alamat' => $alamat,
                'password' => $password
            ];

            if ($this->mahasiswa->createMahasiswa($data) > 0) {
                $this->response([
                    'status' => true,
                    'message' => 'User berhasil ditambahkan'
                ], 201);
            } else {
                $this->response([
                    'status' => false,
                    'message' => 'Data gagal ditambahkan'
                ], 400);
            }
        } elseif (($email != null) && ($password != null)) {
            $result = $this->mahasiswa->loginMahasiswa($email, $password);
            if ($result != null) {
                $this->response([
                    'message' => "Login Success",
                ], 200);
            } else {
                $this->response([
                    'message' => "Login Failed",
                ], 401);
            }
        }
    }

    public function index_put()
    {
        $id = $this->put('id');
        $data = [
            'nohp' => $this->put('nohp'),
            'nama' => $this->put('nama'),
            'email' => $this->put('email'),
            'jurusan' => $this->put('jurusan'),
            'tgl_lahir' => $this->put('tgl_lahir'),
            'alamat' => $this->put('alamat'),
            'password' => hash("sha256", $this->put('password'))
        ];

        if ($this->mahasiswa->updateMahasiswa($data, $id) > 0) {
            $this->response([
                'status' => true,
                'message' => 'Data User berhasil diubah'
            ], 200);
        } else {
            $this->response([
                'status' => false,
                'message' => 'Data gagal diubah'
            ], 400);
        }
    }
}
