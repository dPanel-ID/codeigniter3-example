<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Health check for load balancers and uptime monitors: GET /health.
 * Answers 200 with a small JSON body and never touches a database.
 */
class Health extends CI_Controller {

	public function index()
	{
		$this->output
			->set_status_header(200)
			->set_header('Cache-Control: no-store')
			->set_content_type('application/json', 'utf-8')
			->set_output(json_encode(array(
				'status' => 'ok',
				'framework' => 'CodeIgniter '.CI_VERSION,
			)));
	}
}
