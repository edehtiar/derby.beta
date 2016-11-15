<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
	  <div class="pull-right"><a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_copy; ?>" class="btn btn-warning" onclick="$('#form-product').attr('action', '<?php echo $copy; ?>').submit()"><i class="fa fa-copy"></i></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-product').submit() : false;"><i class="fa fa-trash-o"></i></button>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <div class="maxy-backdrop"></div>
	    <div class="messages-body"></div>
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-product">
          <div class="table-responsive">
            <table class="table table-filter">
			  <tr>
				<td class="text-left">
				  <input type="text" name="filter_name" value="<?php echo $filter_name; ?>" placeholder="<?php echo $entry_name; ?>" class="form-control" />
				</td>
				<td class="text-left">
				  <input type="text" name="filter_category" value="<?php echo $filter_category; ?>" placeholder="<?php echo $entry_categories; ?>" class="form-control" />	
				  <input type="hidden" name="filter_category_id" value="<?php echo $filter_category_id; ?>" />
				</td>
				<td class="text-left">
				  <input type="text" name="filter_manufacturer" value="<?php echo $filter_manufacturer; ?>" placeholder="<?php echo $entry_manufacturer; ?>" class="form-control" />
				  <input type="hidden" name="filter_manufacturer_id" value="<?php echo $filter_manufacturer_id; ?>" />
				</td>
				<td class="text-left">						  
				  <input type="text" name="filter_model" value="<?php echo $filter_model; ?>" placeholder="<?php echo $entry_model; ?>" class="form-control" />
				</td>
			  </tr>
			  <tr>
			    <td class="text-left">
				  <input type="text" name="filter_attribute" value="<?php echo $filter_attribute; ?>" placeholder="<?php echo $entry_attribute; ?>" class="form-control" />	
			      <input type="hidden" name="filter_attribute_id" value="<?php echo $filter_attribute_id; ?>" />
				</td>
				<td class="text-left">
				  <input type="text" name="filter_filter" value="<?php echo $filter_filter; ?>" placeholder="<?php echo $entry_filter; ?>" class="form-control" />	
			      <input type="hidden" name="filter_filter_id" value="<?php echo $filter_filter_id; ?>" />
				</td>
				<td class="text-left">
				  <input type="text" name="filter_sku" value="<?php echo $filter_sku; ?>" placeholder="<?php echo $entry_sku; ?>" class="form-control" />
				</td>
				<td class="text-left">
				  <input type="text" name="filter_location" value="<?php echo $filter_location; ?>" placeholder="<?php echo $entry_location; ?>" class="form-control" />
				</td>
			  </tr>
			  <tr>
				<td class="text-left">
				  <input type="text" name="filter_price" value="<?php echo $filter_price; ?>" placeholder="<?php echo $entry_price; ?>" class="form-control" />
				</td>
				<td class="text-left">
				  <input type="text" name="filter_quantity" value="<?php echo $filter_quantity; ?>" placeholder="<?php echo $entry_quantity; ?>" class="form-control" />
				<td class="text-left">
				  <div class="bootstrap-select">
				  <select name="filter_status" onchange="filter();" class="form-control" title="<?php echo $entry_status; ?>">
                    <option value="*"></option>
                    <?php if ($filter_status) { ?>
					  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					  <?php } else { ?>
					  <option value="1"><?php echo $text_enabled; ?></option>
					  <?php } ?>
					  <?php if (!$filter_status && !is_null($filter_status)) { ?>
					  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
					  <?php } else { ?>
					  <option value="0"><?php echo $text_disabled; ?></option>
					<?php } ?>
                  </select>
				</div>
				</td>
			    <td class="text-left">
				  <button type="button" onclick="filter();" class="btn btn-primary btn-block"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
				</td>
			  </tr>
			</table>
		  </div>
		  <div class="table-responsive">
			<table class="table table-bordered table-hover">
              <thead>
				<tr class="table-selector">
				  <td colspan="10">
				    <div class="selector-left">
					  <div class="col-sm-6">
						<div class="input-group">
						  <span class="input-group-addon input-group-edit"><i class="fa fa-pencil fa-fw"></i> <?php echo $text_mass_edit; ?></span>
						  <select id="top-mass-edit-data" class="form-control selectpicker" title="<?php echo $text_none; ?>" disabled="disabled" data-container="body">
							<optgroup label="<?php echo $text_product_general; ?>">
							  <option value="name"><?php echo $entry_name; ?></option>
							  <option value="description"><?php echo $entry_description; ?></option>
							  <option value="meta_title"><?php echo $entry_meta_title; ?></option>
							  <option value="meta_h1"><?php echo $entry_meta_h1; ?></option>
							  <option value="meta_description"><?php echo $entry_meta_description; ?></option>
							  <option value="meta_keyword"><?php echo $entry_meta_keyword; ?></option>
							  <option value="tag"><?php echo $entry_tag; ?></option>
							</optgroup>
							<optgroup label="<?php echo $text_product_data; ?>">
							  <option value="image"><?php echo $column_image; ?></option>
							  <option value="price"><?php echo $column_price; ?></option>
							  <option value="quantity"><?php echo $column_quantity; ?></option>
							  <option value="min_quantity"><?php echo $entry_minimum; ?></option>
							  <option value="model"><?php echo $text_model; ?></option>
							  <option value="seo"><?php echo $text_seo; ?></option>						  
							  <option value="code"><?php echo $text_code; ?></option>
							  <option value="date_available"><?php echo $text_date_available; ?></option>
							  <option value="shipping"><?php echo $text_shipping; ?></option>
							  <option value="weight"><?php echo $text_size; ?></option>
							</optgroup>
							<optgroup label="<?php echo $text_product_links; ?>">
							  <option value="manufacturer"><?php echo $column_manufacturer; ?></option>
							  <option value="categories"><?php echo $column_category; ?></option>
							  <option value="filter"><?php echo $entry_filter; ?></option>
							  <option value="store"><?php echo $entry_store; ?></option>
							  <option value="download"><?php echo $entry_download; ?></option>
							  <option value="related"><?php echo $entry_related; ?></option>
							</optgroup>
							<optgroup label="<?php echo $text_product_sale; ?>">
							  <option value="discount"><?php echo $text_add_discount; ?></option>
							  <option value="update_discount"><?php echo $text_edit_discount; ?></option>
							  <option value="special"><?php echo $text_add_special; ?></option>
							  <option value="update_special"><?php echo $text_edit_special; ?></option>
							</optgroup>
							<optgroup label="<?php echo $text_attr_option; ?>">
							  <option value="attributes"><?php echo $tab_attribute; ?></option>
							  <option value="options"><?php echo $tab_option; ?></option>
							</optgroup>
							<optgroup label="<?php echo $text_other_data; ?>">
							  <option value="images"><?php echo $text_images; ?></option>
							  <option value="points"><?php echo $entry_reward; ?></option>
							  <option value="design"><?php echo $tab_design; ?></option>
							</optgroup>
						  </select>
						</div>
					  </div>
					</div>
					<div class="selector-right">
					  <div class="col-sm-6">
						<div class="input-group">
						  <span class="input-group-addon input-group-delete"><i class="fa fa-trash-o fa-fw"></i> <?php echo $text_mass_delete; ?></span>
						  <select onchange="massDelete($(this).val());" id="top-mass-delete-data" class="form-control selectpicker" title="<?php echo $text_none; ?>" disabled="disabled" data-container="body">
							<optgroup label="<?php echo $text_product_general; ?>">
							  <option value="name"><?php echo $entry_name; ?></option>
							  <option value="description"><?php echo $entry_description; ?></option>
							  <option value="meta_title"><?php echo $entry_meta_title; ?></option>
							  <option value="meta_h1"><?php echo $entry_meta_h1; ?></option>
							  <option value="meta_description"><?php echo $entry_meta_description; ?></option>
							  <option value="meta_keyword"><?php echo $entry_meta_keyword; ?></option>
							  <option value="tags"><?php echo $entry_tag; ?></option>
							</optgroup>
							<optgroup label="<?php echo $text_product_data; ?>">
							  <option value="image"><?php echo $column_image; ?></option>
							  <option value="model"><?php echo $entry_model; ?></option>						  
							  <option value="sku"><?php echo $entry_sku; ?></option>
							  <option value="upc"><?php echo $entry_upc; ?></option>
							  <option value="ean"><?php echo $entry_ean; ?></option>
							  <option value="jan"><?php echo $entry_jan; ?></option>
							  <option value="isbn"><?php echo $entry_isbn; ?></option>
							  <option value="mpn"><?php echo $entry_mpn; ?></option>
							  <option value="location"><?php echo $entry_location; ?></option>
							  <option value="price"><?php echo $column_price; ?></option>
							  <option value="tax"><?php echo $entry_tax_class; ?></option>
							  <option value="quantity"><?php echo $column_quantity; ?></option>
							  <option value="min_quantity"><?php echo $entry_minimum; ?></option>
							  <option value="seo"><?php echo $text_seo; ?></option>
							  <option value="date_available"><?php echo $entry_date_available; ?></option>
							  <option value="size"><?php echo $entry_size; ?></option>
							  <option value="weight"><?php echo $entry_weight; ?></option>
							  <option value="sort_order"><?php echo $entry_sort_order; ?></option>
							</optgroup>
							<optgroup label="<?php echo $text_product_links; ?>">
							  <option value="manufacturer"><?php echo $column_manufacturer; ?></option>
							  <option value="category"><?php echo $column_category; ?></option>
							  <option value="filter"><?php echo $entry_filter; ?></option>
							  <option value="store"><?php echo $entry_store; ?></option>
							  <option value="download"><?php echo $entry_download; ?></option>
							  <option value="related"><?php echo $entry_related; ?></option>
							</optgroup>
							<optgroup label="<?php echo $text_attr_option; ?>">
							  <option value="attribute"><?php echo $tab_attribute; ?></option>
							  <option value="option"><?php echo $tab_option; ?></option>
							</optgroup>
							<optgroup label="<?php echo $text_product_sale; ?>">
							  <option value="discount"><?php echo $tab_discount; ?></option>
							  <option value="special"><?php echo $tab_special; ?></option>
							</optgroup>
							<optgroup label="<?php echo $text_other_data; ?>">
							  <option value="images"><?php echo $text_images; ?></option>
							  <option value="points"><?php echo $entry_reward; ?></option>
							  <option value="design"><?php echo $tab_design; ?></option>
							  <option value="products"><?php echo $heading_title; ?></option>
							</optgroup>
						  </select>
						</div>
					  </div>
					</div>
				  </td>
				</tr>
				<tr class="table-pagination">
				  <td colspan="10">
					<div class="pull-left"><?php echo $pagination; ?></div>
					<?php if ($pagination) { ?>
					  <div class="pull-right pagination-text"><?php echo $results; ?></div>
					  <?php } else { ?>
					  <div class="pull-right"><?php echo $results; ?></div>
					<?php } ?>
				  </td>
				</tr>
				<tr class="product-list-title">
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td class="text-center" style="width: 80px;"><?php echo $column_image; ?></td>
                  <td class="text-left"><?php if ($sort == 'pd.name') { ?>
                    <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                    <?php } ?>
				  </td>
				  <td class="text-left"><?php if ($sort == 'p2c.category_id') { ?>
				    <a href="<?php echo $sort_category; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_category; ?></a>
				    <?php } else { ?>
				    <a href="<?php echo $sort_category; ?>"><?php echo $column_category; ?></a>
				    <?php } ?>
				  </td>
				  <td class="text-left"><?php if ($sort == 'm.name') { ?>
				    <a href="<?php echo $sort_manufacturer; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_manufacturer; ?></a>
				    <?php } else { ?>
				    <a href="<?php echo $sort_manufacturer; ?>"><?php echo $column_manufacturer; ?></a>
				    <?php } ?>
				  </td>
                  <td class="text-left"><?php if ($sort == 'p.model') { ?>
                    <a href="<?php echo $sort_model; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_model; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_model; ?>"><?php echo $column_model; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-center"><?php if ($sort == 'p.price') { ?>
                    <a href="<?php echo $sort_price; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_price; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_price; ?>"><?php echo $column_price; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-center"><?php if ($sort == 'p.quantity') { ?>
                    <a href="<?php echo $sort_quantity; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_quantity; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_quantity; ?>"><?php echo $column_quantity; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-center" style="width: 90px;"><?php if ($sort == 'p.status') { ?>
                    <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-center" style="min-width: 90px; width: 90px;"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody id="product-list">
                <?php if ($products) { ?>
                <?php foreach ($products as $product) { ?>
                <tr>
                  <td class="text-center"><?php if (in_array($product['product_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>" />
                    <?php } ?></td>
                  <?php if ($product_image) { ?>
				    <td class="text-center"><a data-toggle="popover-maxy" data-target="#product-image-<?php echo $product['product_id']; ?>" data-placement="top" id="product-image<?php echo $product['product_id']; ?>" class="btn-hover-list"><img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" class="img-thumbnail" /></a></td>
				    <?php } else { ?>
				    <td class="text-center"><img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" class="img-thumbnail" /></td>
				  <?php } ?>
                  <?php if ($product_name) { ?>
				    <td class="text-left"><a onclick="getName('<?php echo $product['product_id']; ?>');" data-toggle="popover-maxy" data-target="#product-name-<?php echo $product['product_id']; ?>" data-placement="top top-left" id="product-name<?php echo $product['product_id']; ?>" class="btn-hover-list"><?php echo $product['name']; ?></a></td>
				    <?php } else { ?>
				    <td class="text-left"><?php echo $product['name']; ?></td>
				  <?php } ?>
				  <td class="text-left">
					<?php if ($product_categories) { ?>
					  <a onclick="getCategory('<?php echo $product['product_id']; ?>');" data-toggle="popover-maxy" data-target="#product-category-<?php echo $product['product_id']; ?>" data-placement="top top-left" id="product-categories-<?php echo $product['product_id']; ?>" class="btn-hover-list">
						<?php if ($product['categories']) { ?>
						  <?php foreach ($product['categories'] as $product_category) { ?>
							<div class="text-left"><?php echo $product_category['name']; ?></div>
						  <?php } ?>
						  <?php } else { ?>
						  <div class="text-left"><?php echo $text_without; ?></div>
						<?php } ?>
					  </a>
					  <?php } else { ?>
					  <?php if ($product['categories']) { ?>
						<?php foreach ($product['categories'] as $product_category) { ?>
						  <div class="text-left"><?php echo $product_category['name']; ?></div>
						<?php } ?>
						<?php } else { ?>
						<div class="text-left"><?php echo $text_without; ?></div>
					  <?php } ?>
					<?php } ?>					
				  </td>
				  <td class="text-left">
				    <?php if ($product_manufacturer) { ?>
					  <a onclick="getManufacturer('<?php echo $product['product_id']; ?>');" data-toggle="popover-maxy" data-target="#product-manufacturer-<?php echo $product['product_id']; ?>" data-placement="top" id="product-manufacturer<?php echo $product['product_id']; ?>" class="btn-hover-list">
					    <?php if ($product['manufacturer']) { ?>
						  <?php echo $product['manufacturer']; ?>
				          <?php } else { ?>
						  <?php echo $text_without; ?>
					    <?php } ?>
					  </a>
					  <?php } else { ?>
					  <?php if ($product['manufacturer']) { ?>
						<?php echo $product['manufacturer']; ?>
				        <?php } else { ?>
						<?php echo $text_without; ?>
					  <?php } ?>
					<?php } ?>
				  </td>				  
                  <td class="text-left">
				    <?php if ($product_model) { ?>
					  <a data-toggle="popover-maxy" data-target="#product-model-<?php echo $product['product_id']; ?>" data-placement="top" id="product-model<?php echo $product['product_id']; ?>" class="btn-hover-list">
					    <?php if ($product['model']) { ?>
						  <?php echo $product['model']; ?>
						  <?php } else { ?>
						  <?php echo $text_without; ?>
						<?php } ?>
					  </a>
				      <?php } else { ?>
					  <?php if ($product['model']) { ?>
					    <?php echo $product['model']; ?>
						<?php } else { ?>
						<?php echo $text_without; ?>
					  <?php } ?>
					<?php } ?>
				  </td>
                  <td class="text-center">				
					<?php if ($product_price) { ?>	
					  <a data-toggle="popover-maxy" data-target="#product-price-<?php echo $product['product_id']; ?>" data-placement="top" id="product-price<?php echo $product['product_id']; ?>" class="btn btn-link btn-block"><?php echo $product['price']; ?></a>
                      <?php } else { ?>
					  <?php echo $product['price']; ?>
					<?php } ?>
					<?php if ($product_special) { ?>
					  <a onclick="editMore('<?php echo $product['product_id']; ?>', 'special');" id="product-price-special<?php echo $product['product_id']; ?>" class="btn btn-link btn-block"><span class="text-danger"><?php echo $product['special']; ?></span></a>
                      <?php } else { ?>
					  <div class="text-danger"><?php echo $product['special']; ?></div>
					<?php } ?>  
				  </td>                 
				  <td class="text-center">
				    <?php if ($product_quantity) { ?>
				      <?php if ($product['quantity'] <= 0) { ?>
					    <a data-toggle="popover-maxy" data-target="#product-quantity-<?php echo $product['product_id']; ?>" data-placement="top" id="product-quantity<?php echo $product['product_id']; ?>" class="btn btn-danger btn-sm"><?php echo $product['quantity']; ?></a>
						<?php } elseif ($product['quantity'] <= 4) { ?>
						<a data-toggle="popover-maxy" data-target="#product-quantity-<?php echo $product['product_id']; ?>" data-placement="top" id="product-quantity<?php echo $product['product_id']; ?>" class="btn btn-warning btn-sm"><?php echo $product['quantity']; ?></a>
						<?php } elseif ($product['quantity'] <= 9) { ?>
						<a data-toggle="popover-maxy" data-target="#product-quantity-<?php echo $product['product_id']; ?>" data-placement="top" id="product-quantity<?php echo $product['product_id']; ?>" class="btn btn-info btn-sm"><?php echo $product['quantity']; ?></a>
						<?php } elseif ($product['quantity'] <= 14) { ?>
						<a data-toggle="popover-maxy" data-target="#product-quantity-<?php echo $product['product_id']; ?>" data-placement="top" id="product-quantity<?php echo $product['product_id']; ?>" class="btn btn-primary btn-sm"><?php echo $product['quantity']; ?></a>
						<?php } elseif ($product['quantity'] <= 19) { ?>
						<a data-toggle="popover-maxy" data-target="#product-quantity-<?php echo $product['product_id']; ?>" data-placement="top" id="product-quantity<?php echo $product['product_id']; ?>" class="btn btn-success btn-sm"><?php echo $product['quantity']; ?></a>
						<?php } else { ?>
						<a data-toggle="popover-maxy" data-target="#product-quantity-<?php echo $product['product_id']; ?>" data-placement="top" id="product-quantity<?php echo $product['product_id']; ?>" class="btn btn-default btn-sm"><?php echo $product['quantity']; ?></a>
					  <?php } ?>
                      <?php } else { ?>
					  <?php if ($product['quantity'] <= 0) { ?>
					    <span class="btn btn-danger btn-sm"><?php echo $product['quantity']; ?></span>
						<?php } elseif ($product['quantity'] <= 4) { ?>
						<span class="btn btn-warning btn-sm"><?php echo $product['quantity']; ?></span>
						<?php } elseif ($product['quantity'] <= 9) { ?>
						<span class="btn btn-info btn-sm"><?php echo $product['quantity']; ?></span>
						<?php } elseif ($product['quantity'] <= 14) { ?>
						<span class="btn btn-primary btn-sm"><?php echo $product['quantity']; ?></span>
						<?php } elseif ($product['quantity'] <= 19) { ?>
						<span class="btn btn-success btn-sm"><?php echo $product['quantity']; ?></span>
						<?php } else { ?>
						<span class="btn btn-default btn-sm"><?php echo $product['quantity']; ?></span>
					  <?php } ?>
                    <?php } ?>
				  </td>
                  <td class="text-center">
				    <?php if ($product_status) { ?>
				      <a class="ajax-status" id="status-<?php echo $product['product_id']; ?>"><?php echo $product['status']; ?></a>
				      <?php } else { ?>
				      <?php echo $product['no_status']; ?>
				    <?php } ?>
				  </td>
                  <td class="text-center">
				    <?php if ($product_more) { ?><a data-toggle="popover-maxy" data-target="#product-more-<?php echo $product['product_id']; ?>" data-placement="left" class="btn btn-warning btn-sm"><i class="fa fa-star-o fa-fw"></i></a><?php } ?>
					<a href="<?php echo $product['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary btn-sm"><i class="fa fa-pencil fa-fw"></i></a>
				  </td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="10"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
			  <tfoot>
			    <tr class="product-list-title">
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td class="text-center"><?php echo $column_image; ?></td>
                  <td class="text-left"><?php if ($sort == 'pd.name') { ?>
                    <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                    <?php } ?>
				  </td>
				  <td class="text-left"><?php if ($sort == 'p2c.category_id') { ?>
				    <a href="<?php echo $sort_category; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_category; ?></a>
				    <?php } else { ?>
				    <a href="<?php echo $sort_category; ?>"><?php echo $column_category; ?></a>
				    <?php } ?>
				  </td>
				  <td class="text-left"><?php if ($sort == 'm.name') { ?>
				    <a href="<?php echo $sort_manufacturer; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_manufacturer; ?></a>
				    <?php } else { ?>
				    <a href="<?php echo $sort_manufacturer; ?>"><?php echo $column_manufacturer; ?></a>
				    <?php } ?>
				  </td>
                  <td class="text-left"><?php if ($sort == 'p.model') { ?>
                    <a href="<?php echo $sort_model; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_model; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_model; ?>"><?php echo $column_model; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-center"><?php if ($sort == 'p.price') { ?>
                    <a href="<?php echo $sort_price; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_price; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_price; ?>"><?php echo $column_price; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-center"><?php if ($sort == 'p.quantity') { ?>
                    <a href="<?php echo $sort_quantity; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_quantity; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_quantity; ?>"><?php echo $column_quantity; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-center"><?php if ($sort == 'p.status') { ?>
                    <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-center"><?php echo $column_action; ?></td>
                </tr>
				<tr class="table-pagination">
				  <td colspan="10">
					<div class="pull-left"><?php echo $pagination; ?></div>
					<?php if ($pagination) { ?>
					  <div class="pull-right pagination-text"><?php echo $results; ?></div>
					  <?php } else { ?>
					  <div class="pull-right"><?php echo $results; ?></div>
					<?php } ?>
				  </td>
				</tr>
				<tr class="table-selector">
				  <td colspan="10">
				    <div class="selector-left">
					  <div class="col-sm-6">
						<div class="input-group">
						  <span class="input-group-addon input-group-edit"><i class="fa fa-pencil fa-fw"></i> <?php echo $text_mass_edit; ?></span>
						  <select id="bottom-mass-edit-data" class="form-control selectpicker" title="<?php echo $text_none; ?>" disabled="disabled" data-container="body">
							<optgroup label="<?php echo $text_product_general; ?>">
							  <option value="name"><?php echo $entry_name; ?></option>
							  <option value="description"><?php echo $entry_description; ?></option>
							  <option value="meta_title"><?php echo $entry_meta_title; ?></option>
							  <option value="meta_h1"><?php echo $entry_meta_h1; ?></option>
							  <option value="meta_description"><?php echo $entry_meta_description; ?></option>
							  <option value="meta_keyword"><?php echo $entry_meta_keyword; ?></option>
							  <option value="tag"><?php echo $entry_tag; ?></option>
							</optgroup>
							<optgroup label="<?php echo $text_product_data; ?>">
							  <option value="image"><?php echo $column_image; ?></option>
							  <option value="price"><?php echo $column_price; ?></option>
							  <option value="quantity"><?php echo $column_quantity; ?></option>
							  <option value="min_quantity"><?php echo $entry_minimum; ?></option>
							  <option value="model"><?php echo $text_model; ?></option>
							  <option value="seo"><?php echo $text_seo; ?></option>						  
							  <option value="code"><?php echo $text_code; ?></option>
							  <option value="date_available"><?php echo $text_date_available; ?></option>
							  <option value="shipping"><?php echo $text_shipping; ?></option>
							  <option value="weight"><?php echo $text_size; ?></option>
							</optgroup>
							<optgroup label="<?php echo $text_product_links; ?>">
							  <option value="manufacturer"><?php echo $column_manufacturer; ?></option>
							  <option value="categories"><?php echo $column_category; ?></option>
							  <option value="filter"><?php echo $entry_filter; ?></option>
							  <option value="store"><?php echo $entry_store; ?></option>
							  <option value="download"><?php echo $entry_download; ?></option>
							  <option value="related"><?php echo $entry_related; ?></option>
							</optgroup>
							<optgroup label="<?php echo $text_product_sale; ?>">
							  <option value="discount"><?php echo $text_add_discount; ?></option>
							  <option value="update_discount"><?php echo $text_edit_discount; ?></option>
							  <option value="special"><?php echo $text_add_special; ?></option>
							  <option value="update_special"><?php echo $text_edit_special; ?></option>
							</optgroup>
							<optgroup label="<?php echo $text_attr_option; ?>">
							  <option value="attributes"><?php echo $tab_attribute; ?></option>
							  <option value="options"><?php echo $tab_option; ?></option>
							</optgroup>
							<optgroup label="<?php echo $text_other_data; ?>">
							  <option value="images"><?php echo $text_images; ?></option>
							  <option value="points"><?php echo $entry_reward; ?></option>
							  <option value="design"><?php echo $tab_design; ?></option>
							</optgroup>
						  </select>
						</div>
					  </div>
					</div>
					<div class="selector-right">
					  <div class="col-sm-6">
						<div class="input-group">
						  <span class="input-group-addon input-group-delete"><i class="fa fa-trash-o fa-fw"></i> <?php echo $text_mass_delete; ?></span>
						  <select onchange="massDelete($(this).val());" id="bottom-mass-delete-data" class="form-control selectpicker" title="<?php echo $text_none; ?>" disabled="disabled" data-container="body">
							<optgroup label="<?php echo $text_product_general; ?>">
							  <option value="name"><?php echo $entry_name; ?></option>
							  <option value="description"><?php echo $entry_description; ?></option>
							  <option value="meta_title"><?php echo $entry_meta_title; ?></option>
							  <option value="meta_h1"><?php echo $entry_meta_h1; ?></option>
							  <option value="meta_description"><?php echo $entry_meta_description; ?></option>
							  <option value="meta_keyword"><?php echo $entry_meta_keyword; ?></option>
							  <option value="tags"><?php echo $entry_tag; ?></option>
							</optgroup>
							<optgroup label="<?php echo $text_product_data; ?>">
							  <option value="image"><?php echo $column_image; ?></option>
							  <option value="model"><?php echo $entry_model; ?></option>						  
							  <option value="sku"><?php echo $entry_sku; ?></option>
							  <option value="upc"><?php echo $entry_upc; ?></option>
							  <option value="ean"><?php echo $entry_ean; ?></option>
							  <option value="jan"><?php echo $entry_jan; ?></option>
							  <option value="isbn"><?php echo $entry_isbn; ?></option>
							  <option value="mpn"><?php echo $entry_mpn; ?></option>
							  <option value="location"><?php echo $entry_location; ?></option>
							  <option value="price"><?php echo $column_price; ?></option>
							  <option value="tax"><?php echo $entry_tax_class; ?></option>
							  <option value="quantity"><?php echo $column_quantity; ?></option>
							  <option value="min_quantity"><?php echo $entry_minimum; ?></option>
							  <option value="seo"><?php echo $text_seo; ?></option>
							  <option value="date_available"><?php echo $entry_date_available; ?></option>
							  <option value="size"><?php echo $entry_size; ?></option>
							  <option value="weight"><?php echo $entry_weight; ?></option>
							  <option value="sort_order"><?php echo $entry_sort_order; ?></option>
							</optgroup>
							<optgroup label="<?php echo $text_product_links; ?>">
							  <option value="manufacturer"><?php echo $column_manufacturer; ?></option>
							  <option value="category"><?php echo $column_category; ?></option>
							  <option value="filter"><?php echo $entry_filter; ?></option>
							  <option value="store"><?php echo $entry_store; ?></option>
							  <option value="download"><?php echo $entry_download; ?></option>
							  <option value="related"><?php echo $entry_related; ?></option>
							</optgroup>
							<optgroup label="<?php echo $text_attr_option; ?>">
							  <option value="attribute"><?php echo $tab_attribute; ?></option>
							  <option value="option"><?php echo $tab_option; ?></option>
							</optgroup>
							<optgroup label="<?php echo $text_product_sale; ?>">
							  <option value="discount"><?php echo $tab_discount; ?></option>
							  <option value="special"><?php echo $tab_special; ?></option>
							</optgroup>
							<optgroup label="<?php echo $text_other_data; ?>">
							  <option value="images"><?php echo $text_images; ?></option>
							  <option value="points"><?php echo $entry_reward; ?></option>
							  <option value="design"><?php echo $tab_design; ?></option>
							  <option value="products"><?php echo $heading_title; ?></option>
							</optgroup>
						  </select>
						</div>
					  </div>
					</div>
				  </td>
				</tr>
			  </tfoot>
            </table>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<a id="scroll-to-top" class="hidden animated"><i class="fa fa-chevron-up"></i></a>
<input type="hidden" name="text_confirm" value="<?php echo $text_confirm; ?>" id="text-confirm" />
<input type="hidden" name="error_select_product" value="<?php echo $error_select_product; ?>" id="error-select-product" />
<input type="hidden" name="placeholder" value="<?php echo $placeholder; ?>" id="product-placeholder" />
<input type="hidden" name="permission" value="<?php echo $permission; ?>" id="product-permission" />
<input type="hidden" name="error_permission" value="<?php echo $error_permission; ?>" id="product-error-permission" />
<input type="hidden" name="text_all_categories" value="<?php echo $text_all_categories; ?>" id="product-text-all-categories" />
<input type="hidden" name="text_all_brands" value="<?php echo $text_all_brands; ?>" id="product-text-all-brands" />
<input type="hidden" name="text_all_attributes" value="<?php echo $text_all_attributes; ?>" id="product-text-all-attributes" />
<input type="hidden" name="text_all_filters" value="<?php echo $text_all_filters; ?>" id="product-text-all-filters" />
<input type="hidden" name="text_no_category" value="<?php echo $text_no_category; ?>" id="product-text-no-category" />
<input type="hidden" name="text_no_brand" value="<?php echo $text_no_brand; ?>" id="product-text-no-brand" />
<input type="hidden" name="text_no_attribute" value="<?php echo $text_no_attribute; ?>" id="product-text-no-attribute" />
<input type="hidden" name="text_no_filter" value="<?php echo $text_no_filter; ?>" id="product-text-no-filter" />
<input type="hidden" name="text_without" value="<?php echo $text_without; ?>" id="text-without" />
<?php foreach ($products as $product) { ?>
<div id="product-image-<?php echo $product['product_id']; ?>" class="popover popover-primary animated-fast zoomIn">
  <div class="arrow"></div><h3 class="popover-title"><?php echo $column_image; ?>
  <a id="close-image-<?php echo $product['product_id']; ?>" data-dismiss="popover-maxy" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
  <div class="popover-content">
	<a onclick="linkImage('<?php echo $product['product_id']; ?>');" class="btn btn-link"><img src="<?php echo $product['thumb']; ?>" class="img-thumbnail" /></a><input type="hidden" name="image" value="" id="product-image" />
  </div>
  <div class="popover-footer">
    <a onclick="editImage('<?php echo $product['product_id']; ?>');" class="btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a><a onclick="imageClear('<?php echo $product['product_id']; ?>');" class="btn btn-danger btn-sm"><i class="fa fa-eraser fa-fw"></i></a>
  </div>
</div>
<div id="product-name-<?php echo $product['product_id']; ?>" class="popover popover-lg popover-primary animated-fast zoomIn" style="height: 198px !important;">
  <div class="arrow"></div>
  <h3 class="popover-title"><?php echo $column_name; ?><a id="close-name-<?php echo $product['product_id']; ?>" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
  <div id="product-name-content-<?php echo $product['product_id']; ?>"></div>
</div>
<div id="product-category-<?php echo $product['product_id']; ?>" class="popover popover-xl popover-primary animated-fast zoomIn" style="height: 340px !important;">
  <div class="arrow"></div>
  <h3 class="popover-title"><?php echo $column_category; ?><a id="close-category-<?php echo $product['product_id']; ?>" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
  <div id="product-category-content-<?php echo $product['product_id']; ?>"></div>
</div>
<div id="product-manufacturer-<?php echo $product['product_id']; ?>" class="popover popover-primary animated-fast zoomIn" style="height: 134px !important;">
  <div class="arrow"></div>
  <h3 class="popover-title"><?php echo $column_manufacturer; ?><a id="close-manufacturer-<?php echo $product['product_id']; ?>" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
  <div id="product-manufacturer-content-<?php echo $product['product_id']; ?>"></div>
</div>
<div id="product-model-<?php echo $product['product_id']; ?>" class="popover popover-primary animated-fast zoomIn">
  <div class="arrow"></div><h3 class="popover-title"><?php echo $column_model; ?>
  <a id="close-model-<?php echo $product['product_id']; ?>" data-dismiss="popover-maxy" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
  <div class="popover-content">
	<input type="text" name="model" value="<?php echo $product['model']; ?>" placeholder="<?php echo $column_model; ?>" id="input-model<?php echo $product['product_id']; ?>" class="form-control" />
  </div>
  <div class="popover-footer">
    <a onclick="editModel('<?php echo $product['product_id']; ?>');" class="btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a><a onclick="modelClear('<?php echo $product['product_id']; ?>');" class="btn btn-danger btn-sm"><i class="fa fa-eraser fa-fw"></i></a>
  </div>
</div>
<div id="product-quantity-<?php echo $product['product_id']; ?>" class="popover popover-primary animated-fast zoomIn">
  <div class="arrow"></div><h3 class="popover-title"><?php echo $column_quantity; ?>
  <a id="close-quantity-<?php echo $product['product_id']; ?>" data-dismiss="popover-maxy" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
  <div class="popover-content">
    <input type="text" name="quantity" value="<?php echo $product['quantity']; ?>" placeholder="<?php echo $column_quantity; ?>" id="input-quantity<?php echo $product['product_id']; ?>" class="form-control" />
  </div>
  <div class="popover-footer">
    <a onclick="editQuantity('<?php echo $product['product_id']; ?>');" class="btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a><a onclick="quantityClear('<?php echo $product['product_id']; ?>');" class="btn btn-danger btn-sm"><i class="fa fa-eraser fa-fw"></i></a>
  </div>
</div>
<div id="product-price-<?php echo $product['product_id']; ?>" class="popover popover-primary animated-fast zoomIn">
  <div class="arrow"></div><h3 class="popover-title"><?php echo $column_price; ?>
  <a id="close-price-<?php echo $product['product_id']; ?>" data-dismiss="popover-maxy" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
  <div class="popover-content">
    <input type="number" name="price" value="<?php echo $product['price_not_formated']; ?>" placeholder="<?php echo $column_price; ?>" id="input-price<?php echo $product['product_id']; ?>" class="form-control" />
  </div>
  <div class="popover-footer">
    <a onclick="editPrice('<?php echo $product['product_id']; ?>');" class="btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a><a onclick="priceClear('<?php echo $product['product_id']; ?>');" class="btn btn-danger btn-sm"><i class="fa fa-eraser fa-fw"></i></a>
  </div>
</div>
<div id="product-more-<?php echo $product['product_id']; ?>" class="popover popover-primary popover-xxl animated-fast zoomIn">
  <div class="arrow"></div>
  <div class="popover-content">
	<?php if ($product_general) { ?><a onclick="editMore('<?php echo $product['product_id']; ?>', 'general');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $text_general; ?>"><i class="fa fa-reorder fa-fw"></i></a><?php } ?>
	<?php if ($product_code) { ?><a onclick="editMore('<?php echo $product['product_id']; ?>', 'code');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $text_code; ?>"><i class="fa fa-code fa-fw"></i></a><?php } ?>
	<?php if ($product_tax) { ?><a onclick="editMore('<?php echo $product['product_id']; ?>', 'tax');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $text_tax; ?>"><i class="fa fa-globe fa-fw"></i></a><?php } ?>
	<?php if ($product_stock) { ?><a onclick="editMore('<?php echo $product['product_id']; ?>', 'stock');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $text_stock; ?>"><i class="fa fa-truck fa-fw"></i></a><?php } ?>
	<?php if ($product_seo) { ?><a onclick="editMore('<?php echo $product['product_id']; ?>', 'seo');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $text_seo; ?>"><i class="fa fa-link fa-fw"></i></a><?php } ?>
	<?php if ($product_date) { ?><a onclick="editMore('<?php echo $product['product_id']; ?>', 'date');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $entry_date_available; ?>"><i class="fa fa-calendar fa-fw"></i></a><?php } ?>
	<?php if ($product_size) { ?><a onclick="editMore('<?php echo $product['product_id']; ?>', 'size');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $text_size; ?>"><i class="fa fa-arrows-alt fa-fw"></i></a><?php } ?>
	<?php if ($product_filter) { ?><a onclick="editMore('<?php echo $product['product_id']; ?>', 'filter');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $entry_filter; ?>"><i class="fa fa-filter fa-fw"></i></a><?php } ?>
	<?php if ($product_store) { ?><a onclick="editMore('<?php echo $product['product_id']; ?>', 'store');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $entry_store; ?>"><i class="fa fa-flag fa-fw"></i></a><?php } ?>
	<?php if ($product_download) { ?><a onclick="editMore('<?php echo $product['product_id']; ?>', 'download');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $entry_download; ?>"><i class="fa fa-download fa-fw"></i></a><?php } ?>
	<?php if ($product_related) { ?><a onclick="editMore('<?php echo $product['product_id']; ?>', 'related');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $entry_related; ?>"><i class="fa fa-thumbs-o-up fa-fw"></i></a><?php } ?>
	<?php if ($product_attribute) { ?><a onclick="editMore('<?php echo $product['product_id']; ?>', 'attribute');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $entry_attribute; ?>"><i class="fa fa-cogs fa-fw"></i></a><?php } ?>
	<?php if ($product_option) { ?><a onclick="editMore('<?php echo $product['product_id']; ?>', 'option');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $tab_option; ?>"><i class="fa fa-cubes fa-fw"></i></a><?php } ?>
	<?php if ($product_discount) { ?><a onclick="editMore('<?php echo $product['product_id']; ?>', 'discount');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $tab_discount; ?>"><i class="fa fa-legal fa-fw"></i></a><?php } ?>
	<?php if ($product_special) { ?><a onclick="editMore('<?php echo $product['product_id']; ?>', 'special');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $tab_special; ?>"><i class="fa fa-tag fa-fw"></i></a><?php } ?>
	<?php if ($product_images) { ?><a onclick="editMore('<?php echo $product['product_id']; ?>', 'images');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $tab_image; ?>"><i class="fa fa-image fa-fw"></i></a><?php } ?>
	<?php if ($product_reward) { ?><a onclick="editMore('<?php echo $product['product_id']; ?>', 'reward');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $entry_reward; ?>"><i class="fa fa-yelp fa-fw"></i></a><?php } ?>
	<?php if ($product_design) { ?><a onclick="editMore('<?php echo $product['product_id']; ?>', 'design');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $tab_design; ?>"><i class="fa fa-paint-brush fa-fw"></i></a><?php } ?>
	<?php if ($product_view) { ?><a onclick="closeMore('<?php echo $product['product_id']; ?>');" href="<?php echo HTTP_CATALOG;?>?route=product/product&product_id=<?php echo $product['product_id'];?>" class="btn btn-default btn-sm" data-toggle="tooltip" target="_blank" title="<?php echo $button_view; ?>"><i class="fa fa-eye fa-fw"></i></a><?php } ?>
  </div>
</div>
<?php } ?>
<div id="modal-product-edit" class="modal fade">
  <div class="modal-dialog modal-lg animated zoomIn">
    <div class="modal-content">
	  <div id="modal-product-content"></div>
	</div>
  </div>
</div>
<?php echo $footer; ?>