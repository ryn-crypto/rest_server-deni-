<?php
defined('BASEPATH') or exit('No direct script access allowed');
require APPPATH . "libraries/format.php";
require APPPATH . "libraries/RestController.php";


use chriskacerguis\RestServer\RestController;

class Penerbangan extends RESTController
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('Penerbangan_model', 'penerbangan');
    }

    function index_get()
    {
        $id_penerbangan = $this->get('id_penerbangan');
        if ($id_penerbangan === null) {
            $penerbangan = $this->penerbangan->getPenerbangan();
        } else {
            $penerbangan = $this->penerbangan->getPenerbangan($id_penerbangan);
        }

        if ($penerbangan) {
            $this->response([
                'status' => TRUE,
                'data' => $penerbangan
            ], RestController::HTTP_OK);
        } else {
            $this->response([
                'status' => FALSE,
                'message' => 'id not found'
            ], RestController::HTTP_NOT_FOUND);
        }
    }

    function index_delete()
    {
        $id_penerbangan = $this->delete('id_penerbangan');

        if ($id_penerbangan === null) {
            $this->response([
                'status' => FALSE,
                'message' => 'provide an id!'
            ], RestController::HTTP_BAD_REQUEST);
        } else {
            if ($this->penerbangan->deletePenerbangan($id_penerbangan) > 0) {
                //ok
                $this->response([
                    'status' => TRUE,
                    'id_penerbangan' => $id_penerbangan,
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

    function index_post()
    {
        $data = [
            'id_penerbangan' => $this->post('id_penerbangan'),
            'id_penumpang' => $this->post('id_penumpang'),
            'tujuan' => $this->post('tujuan'),
            'nomor_penerbangan' => $this->post('nomor_penerbangan'),
            'tanggal' => $this->post('tanggal'),
        ];

        if ($this->penerbangan->createPenerbangan($data) > 0) {
            $this->response([
                'status' => TRUE,
                'message' => 'new penerbangan has been created.'
            ], RestController::HTTP_CREATED);
        } else {
            $this->response([
                'status' => FALSE,
                'message' => 'failed to create new data!'
            ], RestController::HTTP_BAD_REQUEST);
        }
    }

    function index_put()
    {
        $id_penerbangan = $this->put('id_penerbangan');
        $data = [
            'id_penumpang' => $this->put('id_penumpang'),
            'tujuan' => $this->put('tujuan'),
            'nomor_penerbangan' => $this->put('nomor_penerbangan'),
            'tanggal' => $this->put('tanggal'),
        ];

        if ($this->penerbangan->updatePenerbangan($data, $id_penerbangan) > 0) {
            $this->response([
                'status' => TRUE,
                'message' => 'data penerbangan has been updated.'
            ], RestController::HTTP_OK);
        } else {
            $this->response([
                'status' => FALSE,
                'message' => 'failed to update data!'
            ], RestController::HTTP_BAD_REQUEST);
        }
    }
}
