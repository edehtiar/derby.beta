<div class="popover-content" style="height: 120px !important;">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-attribute-group-name-<?php echo $attribute_group_id; ?>">
    <div class="row">
      <div class="form-group required">
	    <?php foreach ($languages as $language) { ?>
		  <div class="col-sm-12">
			<div class="input-group" style="margin-bottom: 3px;"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span><input type="text" name="attribute_group_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($attribute_group_description[$language['language_id']]) ? $attribute_group_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" class="form-control" /></div>
		  </div>
	    <?php } ?>
	  </div>
    </div>
  </form>
</div>
<div class="popover-footer">
  <a data-form="form-attribute-group-name-<?php echo $attribute_group_id; ?>" class="button-save btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a><a id="clear-attribute-group-name-<?php echo $attribute_group_id; ?>" class="btn btn-danger btn-sm"><i class="fa fa-eraser fa-fw"></i></a>
</div>
<script type="text/javascript"><!--
$('.button-save').on('click', function() {	
	var name = $('input[name="attribute_group_description[<?php echo $config_language_id; ?>][name]"]').val(); 	
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#form-attribute-group-name-<?php echo $attribute_group_id; ?> input[type="text"]'),
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);
								
				$('#attribute-group-name<?php echo $attribute_group_id; ?>').html(name);
				$('#close-group-name-<?php echo $attribute_group_id; ?>').trigger('click');
			}
		}
	});
}); 

$('#close-group-name-<?php echo $attribute_group_id; ?>').on('click', function() {
	$('#form-attribute-group-name-<?php echo $attribute_group_id; ?>').empty();
	$('#attribute-group-name-<?php echo $attribute_group_id; ?>').popoverMaxy('hide');
});	

$('#attribute-group-name-<?php echo $attribute_group_id; ?>').on('hide.bs.modal', function () {
	$('#form-attribute-group-name-<?php echo $attribute_group_id; ?>').empty();
});

$('#clear-attribute-group-name-<?php echo $attribute_group_id; ?>').on('click', function() {
	$('#form-attribute-group-name-<?php echo $attribute_group_id; ?>').find('input').val('');
});  
//--></script>