<?php
defined('BASEPATH') or exit('No direct script access allowed');
require APPPATH . "libraries/format.php";
require APPPATH . "libraries/RestController.php";


use chriskacerguis\RestServer\RestController;


class Penumpang extends RestController
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Penumpang_model', 'penumpang');

        $this->methods['index_get']['limit'] = 200;
    }

    public function index_get()
    {
        $id_penumpang = $this->get('id_penumpang');
        if ($id_penumpang === null) {
            $penumpang = $this->penumpang->getPenumpang();
        } else {
            $penumpang = $this->penumpang->getPenumpang($id_penumpang);
        }

        if ($penumpang) {
            $this->response([
                'status' => TRUE,
                'data' => $penumpang
            ], RestController::HTTP_OK);
        } else {
            $this->response([
                'status' => FALSE,
                'message' => 'id not found'
            ], RestController::HTTP_NOT_FOUND);
        }
    }

    public function index_delete()
    {
        $id_penumpang = $this->delete('id_penumpang');

        if ($id_penumpang === null) {
            $this->response([
                'status' => FALSE,
                'message' => 'provide an id!'
            ], RestController::HTTP_BAD_REQUEST);
        } else {
            if ($this->penumpang->deletePenumpang($id_penumpang) > 0) {
                //ok
                $this->response([
                    'status' => TRUE,
                    'id_penumpang' => $id_penumpang,
                    'message' => 'deleted.'
                ], RestController::HTTP_OK);
            } else {
                //id not found
                $this->response([
                    'status' => FALSE,
                    'message' => 'id not found!'
                ], RestController::HTTP_BAD_REQUEST);
            }
        }
    }

    public function index_post()
    {
        $data = [
            'nama' => $this->post('nama'),
            'negara' => $this->post('negara'),
            'passport' => $this->post('passport')
        ];

        if ($this->penumpang->createPenumpang($data) > 0) {
            $this->response([
                'status' => TRUE,
                'message' => 'new penumpang has been created.'
            ], RestController::HTTP_CREATED);
        } else {
            $this->response([
                'status' => FALSE,
                'message' => 'failed to create new data!'
            ], RestController::HTTP_BAD_REQUEST);
        }
    }

    public function index_put()
    {
        $id_penumpang = $this->put('id_penumpang');
        $data = [
            'nama' => $this->put('nama'),
            'negara' => $this->put('negara'),
            'passport' => $this->put('passport')
        ];

        if ($this->penumpang->updatePenumpang($data, $id_penumpang) > 0) {
            $this->response([
                'status' => TRUE,
                'message' => 'data penumpang has been updated.'
            ], RestController::HTTP_OK);
        } else {
            $this->response([
                'status' => FALSE,
                'message' => 'failed to update data!'
            ], RestController::HTTP_BAD_REQUEST);
        }
    }
}
