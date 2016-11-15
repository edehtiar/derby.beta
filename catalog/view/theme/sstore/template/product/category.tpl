<?php echo $header; ?>
<?php echo $content_top; ?>
    <div id="container">
    <div class="row">
        <ul class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
        </ul>
    </div>
  <div class="content">
    <div class="top-menu">
        <div class="display">                    
            <h1 class="category-header"><?php echo $heading_title; ?></h1>
        </div>
        <div class="show-items"><?php echo $text_limit; ?>
            <select id="input-limit" onchange="location = this.value;">
                <?php foreach ($limits as $limits) { ?>
                    <?php if ($limits['value'] == $limit) { ?>
                        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                    <?php } else { ?>
                        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                    <?php } ?>
                <?php } ?>
            </select>            
        </div>           
        <div class="sort"><?php echo $text_sort; ?>
            <select id="input-sort" onchange="location = this.value;">
                <?php foreach ($sorts as $sorts) { ?>
                    <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                    <?php } else { ?>
                        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                    <?php } ?>
                <?php } ?>
            </select>              
        </div>
     </div>
     <div class="clearfix"></div>
     <?php echo $column_left; ?><?php echo $column_right; ?>
   <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
  <article id="content" class="<?php echo $class; ?>">
 <?php if ($categories) { ?>
  <div class="subcategory-header"><?php echo $text_refine; ?></div>
  <div class="category-list">
    <?php  if (count($categories) <= 5) { ?>
    
      <?php foreach ($categories as $category) { ?>
      <div class="col-md-2 col-xs-6">
        <div class="category-list-item">
        	<?php if($category['thumb']) { ?>
            <a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>"><span><?php echo $category['name']; ?></span></a>
            <?php } else { ?>
            <a href="<?php echo $category['href']; ?>"><span><?php echo $category['name']; ?></span></a>
            <?php } ?>
        </div>
      </div>
      <?php } ?>
    
    <?php } else { ?>
    <?php for ($i = 0; $i < count($categories);) { ?>
    
      <?php $j = $i + ceil(count($categories) / 3); ?>
      <?php for (; $i < $j; $i++) { ?>
      <?php if (isset($categories[$i])) { ?>
            <div class="col-lg-2 col-md-3 col-sm-4 col-xs-4">
        <div class="category-list-item">
            <?php if($categories[$i]['thumb']) { ?>
            <a href="<?php echo $categories[$i]['href']; ?>"><img src="<?php echo $categories[$i]['thumb']; ?>" alt="<?php echo $categories[$i]['name']; ?>" title="<?php echo $categories[$i]['name']; ?>"><span><?php echo $categories[$i]['name']; ?></span></a>
            <?php } else { ?>
            <a href="<?php echo $categories[$i]['href']; ?>"><span><?php echo $categories[$i]['name']; ?></span></a>
            <?php } ?>
        </div>
      </div>
      <?php } ?>
      <?php } ?>
    
    <?php } ?>
    <?php } ?>
    <div class="clearfix"></div>
    
  </div>
  <?php } ?>
  <div class="mobile-category-header"></div>
  <div id="res-products">
  <?php if ($products) { ?>  
  <div class="product-grid row">
    <?php $a = 0; ?>
    <?php foreach ($products as $product) { ?>
    <div class="cols col-lg-4 col-md-4 col-sm-4 col-xs-4">    
    <div class="product">
        <?php if ($product['product_stickers']) { ?>
        <div class="sticker-box-cat">
          <?php foreach ($product['product_stickers'] as $product_sticker) { ?>
            <span class="stickers-cat" style="color: <?php echo $product_sticker['color']; ?>; background: <?php echo $product_sticker['background']; ?>;">
              <?php echo $product_sticker['text']; ?>
            </span>
          <?php } ?>
        </div>
        <?php } ?>        
        <?php if ($product['economy']) { ?>
            <div class="sticker">-<?php echo $product['economy']; ?>%</div>
        <?php } ?>
     
        <?php if ($product['thumb']) { ?>
            <div class="image">
              <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>
                     <?php if ($product['dop_img']) { ?>
                        <a class="hover-image" href="<?php echo $product['href']; ?>"><img src="<?php echo $product['dop_img']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>
                    <?php } ?>
                    <?php if (isset($popup_view_data['status']) && $popup_view_data['status']) { ?>
                    <a href='javascript:void(0);' class='popup_view_button' onclick='get_popup_view("<?php echo $product['product_id']; ?>");'><?php echo $popup_view_text['button_popup_view']; ?></a>
                    <?php } ?>
            </div>
        <?php } ?>
        <div class="product-about">
            <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
            <div class="description"><?php echo $product['description']; ?></div>
            <?php if ($product['price']) { ?>
               <div class="price">
               <?php if (!$product['special']) { ?>
                  <?php echo $product['price']; ?>
            <?php } else { ?>
               <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
            <?php } ?>
          </div>
          <?php } ?>
          <?php if (isset($product['oct_options']) && $product['oct_options']) { ?>
            <div class="cat-options">
              <?php foreach ($product['oct_options'] as $option) { ?>
                <?php if ($option['type'] == 'image') { ?>
                  <div class="form-group">
                    <label class="control-label"><?php echo $option['name']; ?>: </label>
                    <?php if ($option['product_option_value']) { ?>
                      <?php foreach ($option['product_option_value'] as $product_option_value) { ?>
                        <div class="radio">
                          <label>
                            <img src="<?php echo $product_option_value['image']; ?>" alt="<?php echo $product_option_value['name']; ?>" class="img-responsive" title="<?php echo $product_option_value['name']; ?>" />
                          </label>
                        </div>
                      <?php } ?>
                    <?php } ?>
                  </div>
                <?php } else { ?>
                  <div class="form-group size-box">
                    <label class="control-label"><?php echo $option['name']; ?>: </label>
                    <?php if ($option['product_option_value']) { ?>
                      <?php foreach ($option['product_option_value'] as $product_option_value) { ?>
                        <div class="radio">
                          <label><?php echo $product_option_value['name']; ?></label>
                        </div>
                      <?php } ?>
                    <?php } ?>
                  </div>
                <?php } ?>
              <?php } ?>
            </div>
          <?php } ?>
          <div class="product-buttons">
              <?php if ($product['rating']) { ?>
               <div class="rating">
		          <?php for ($i = 1; $i <= 5; $i++) { ?>
		          <?php if ($product['rating'] < $i) { ?>
		          <span><i class="fa fa-star-o stars-rev"></i></span>
		          <?php } else { ?>
		          <span><i class="fa fa-star stars-rev"></i></span>
		          <?php } ?>
		          <?php } ?>
		        </div>
            <?php } ?>
              <a class="cart" onclick="addToCart('<?php echo $product['product_id']; ?>');">
                <i class="fa fa-shopping-cart" aria-hidden="true"></i><?php echo $button_cart; ?>
              </a>
              <div class="additional">
                  <a class="wishlist" onclick="addToWishList('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart-o" aria-hidden="true"></i></a>
                  <a class="compare" onclick="addToCompare('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange" aria-hidden="true"></i></a>
              </div>
          </div>
          
        </div>
        
    </div> </div> 
     
    <?php } ?>
    
   
  <?php  } else { ?>
  <div>
  <?php } ?>
  
    <div class="pagination"><?php echo $pagination; ?></div> 

  </div>
     <?php if ($thumb != "" OR $description != "") { ?>
      <div class="category-info">
        <?php if ($thumb) { ?>
        <div class="img"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
        <?php } ?>
        <?php if ($description) { ?>
        <?php echo $description; ?>
        <?php } ?>
      </div>
  <?php } ?>
  <?php if (!$categories && !$products) { ?>
  <div class="content"><?php echo $text_empty; ?>

  <?php } ?>
      <div class="clearfix"></div>
  </div>
  
  
<div class="clearfix"></div>
</article>
<div class="clearfix"></div>
</div>
</div>

  

<?php echo $content_bottom; ?>
<div class="clearfix"></div>

<script>
	    
	    $(window).on('resize', function(){
		      var win = $(this); //this = window
		      if (win.width() >= 768) {
		      	$("#ismobile") .prependTo("#column-left");
		      	$('#filter-mobile').css('display', 'none');
		      } else {
			      $('#filter-mobile').css('display', 'block');
			      $("#ismobile") .appendTo("#filter-mobile");
		      }
		      
		});

		cols = $('#column-right, #column-left').length;

		if (cols == 2) {
			$('#content .product-grid .cols').attr('class', 'col-lg-6 col-md-6 col-sm-6 col-xs-6');
		} else if (cols == 1) {
			$('#content .product-grid .cols').attr('class', 'col-lg-4 col-md-4 col-sm-6 col-xs-6');
		} else {
			$('#content .product-grid .cols').attr('class', 'col-lg-3 col-md-3 col-sm-6 col-xs-6');
		}
        
        cols1 = $('#column-right, #column-left').length;
	
    	if (cols1 == 2) {
    		$('#content .product-grid > div:nth-child(2n+2)').after('<div class="clearfix visible-md visible-sm"></div>');
    	} else if (cols1 == 1) {
    		$('#content .product-grid > div:nth-child(3n+3)').after('<div class="clearfix visible-lg"></div>');
    	} else {
    		$('#content .product-grid > div:nth-child(4n+4)').after('<div class="clearfix"></div>');
    	}
    	
    	    


</script>
<?php echo $footer; ?>