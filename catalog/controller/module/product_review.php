<?php
class ControllerModuleProductReview extends Controller {
	public function index($setting) {
		$this->load->language('module/product_review');

		$data['heading_title'] = $this->language->get('heading_title');

		$this->load->model('catalog/product');
		$this->load->model('module/product_review');

		$this->load->model('tool/image');

		$data['reviews'] = array();

		if (!$setting['limit']) {
			$setting['limit'] = 4;
		}

		$filter_data = array(
			'limit' => $setting['limit'],
			'start' => 0
		);
		
		
		$data['position'] = $setting['position'];

		$reviews = $this->model_module_product_review->getAllReviews($filter_data);
		// print_r($reviews);
		
		

		foreach ($reviews as $review) {
			
				if ($review['image']) {
					$image = $this->model_tool_image->resize($review['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}

				$data['reviews'][] = array(
					'product_id'  => $review['product_id'],
					'thumb'       => $image,
					'name'        => $review['name'],
					'text' 				=> utf8_substr(strip_tags(html_entity_decode($review['text'], ENT_QUOTES, 'UTF-8')), 0, 200) . '..',
					'rating'      => $review['rating'],
					'href'        => $this->url->link('product/product', 'product_id=' . $review['product_id'])
				);
			
		}

		if ($data['reviews']) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/product_review.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/product_review.tpl', $data);
			} else {
				return $this->load->view('default/template/module/product_review.tpl', $data);
			}
		}
	}
}
