<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $entry_meta_keyword; ?></h4>
</div>
<div class="modal-body" id="body-mass-product-meta-keyword">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-mass-product-meta-keyword" class="form-horizontal">	
    <div class="alert alert-info"><?php echo $text_generator_info; ?></div>
	<div class="form-group">
	  <label class="col-sm-3 control-label"><?php echo $entry_generator; ?></label>
	  <div class="col-sm-9">
		<div class="input-checkbox">
		  <input type="checkbox" class="checkbox" name="meta_keyword_generator" value="1" id="meta_keyword_generator" />
		  <label for="meta_keyword_generator"></label>
		</div>
	  </div>
	</div>
	<div class="form-group required" id="meta-keyword-custom">	
	  <?php foreach ($languages as $language) { ?>
		<label class="col-sm-3 control-label"><?php echo $entry_meta_keyword; ?></label>
		<div class="col-sm-9">
		  <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span><textarea name="product_description[<?php echo $language['language_id']; ?>][meta_keyword]" rows="2" placeholder="<?php echo $entry_meta_keyword; ?>" class="form-control"></textarea></div><br />
		</div>
	  <?php } ?>
	</div>
	<div class="form-group hidden" id="meta-keyword-generator">
	  <label class="col-sm-3 control-label" for="input-meta-language"><?php echo $entry_language; ?></label>
	  <div class="col-sm-9">
		<select name="language_id" id="input-meta-language" class="form-control">
		  <?php foreach ($languages as $language) { ?>
			<option value="<?php echo $language['language_id']; ?>"><?php echo $language['name']; ?></option>
		  <?php } ?>
		</select>
	  </div>
	</div>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-mass-product-meta-keyword" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
</div>
<script type="text/javascript"><!--
$(".button-save").on('click', function(){		
	var text_confirm = '<?php echo $text_rewrite_meta_keyword; ?>';
	
	if (confirm(text_confirm)) {
		$.ajax({
			url: $('#' + $(this).data('form')).attr('action'),
			type: 'post',
			dataType: 'json',
			data: $('#product-list input[type=\'checkbox\']:checked, #' + $(this).data('form') + ' input[type=\'text\'], #' + $(this).data('form') + ' input[type=\'checkbox\']:checked, #' + $(this).data('form') + ' select, #' + $(this).data('form') + ' textarea'),
			success: function(json) {
				if (json['error']) {
					$('#form-mass-product-meta-keyword').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
					
					$('.alert-danger').delay(1500).fadeOut(500);
				}
									
				if (json['success']) {
					$('#form-mass-product-meta-keyword').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');	
					
					setTimeout(function(){
						$('#modal-product-edit').modal('hide');
					}, 1000)
				}
			}
		});
	}
});  
//--></script>
<script type="text/javascript"><!--
$('#form-mass-product-meta-keyword input[id=\'meta_keyword_generator\']').on('change', function() {
	if ($('#form-mass-product-meta-keyword input[id=\'meta_keyword_generator\']:checked').val()) {
		$('#meta-keyword-generator').removeClass('hidden');
		$('#meta-keyword-custom').addClass('hidden');
	} else {
		$('#meta-keyword-generator').addClass('hidden');
		$('#meta-keyword-custom').removeClass('hidden');
	}
});
//--></script>