<?php
class ControllerModuleShippingData extends Controller {
	public function getShippingData() {
		$json = array();

		if (isset($this->request->post['shipping'])) {
			$shipping = $this->request->post['shipping'];
		} else {
			$shipping = '';
		}
		
		if (isset($this->request->post['action'])) {
			$action = $this->request->post['action'];
		} else {
			$action = '';
		}
		
		if (isset($this->request->post['filter'])) {
			$filter = $this->request->post['filter'];
		} else {
			$filter = '';
		}
		
		if (isset($this->request->post['search'])) {
			$search = $this->request->post['search'];
		} else {
			$search = '';
		}
		
		switch($shipping) {
			case 'novaposhta.Warehouse':
				$this->load->model('module/shippingdata');
				
				if ($action == 'getCities') {
					require_once(DIR_SYSTEM . 'helper/novaposhta.php');
					
					$novaposhta = new NovaPoshta($this->registry);
					
					$this->load->model('localisation/zone');
					
					$zone_info = $this->model_localisation_zone->getZone($filter);
					
					if ($zone_info) {
						$filter = $novaposhta->getAreaRef($zone_info['name']);
					}
					
					$json = $this->model_module_shippingdata->getNovaPoshtaCities($filter, $search);
				} elseif ($action == 'getWarehouses') {
					$json = $this->model_module_shippingdata->getNovaPoshtaWarehouses($filter, $search);
				}
				
				break;
			
			case 'novaposhta.Doors':
				if ($action == 'getCities') {
					require_once(DIR_SYSTEM . 'helper/novaposhta.php');
					
					$novaposhta = new NovaPoshta($this->registry);
					
					$this->load->model('localisation/zone');
					$this->load->model('module/shippingdata');
					
					$zone_info = $this->model_localisation_zone->getZone($filter);
					
					if ($zone_info) {
						$filter = $novaposhta->getAreaRef($zone_info['name']);
					}
					
					$json = $this->model_module_shippingdata->getNovaPoshtaCities($filter, $search);
				}
				
				break;
		}
				
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}