<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-purchase" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-purchase" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#setting-tab" data-toggle="tab"><?php echo $tab_setting; ?></a></li>
            <li><a href="#list-tab" data-toggle="tab"><?php echo $tab_list; ?></a></li>
            <!--<li><a href="#display-tab" data-toggle="tab"><?php echo $tab_display; ?></a></li>-->
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="setting-tab">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="popup_found_cheaper_data[status]" id="input-status" class="form-control">
                    <?php if ($popup_found_cheaper_data['status']) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_notify_status; ?></label>
                <div class="col-sm-10">
                  <select name="popup_found_cheaper_data[notify_status]" id="input-notify_status" class="form-control">
                    <?php if ($popup_found_cheaper_data['notify_status']) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-notify_email"><?php echo $entry_notify_email; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_found_cheaper_data[notify_email]" value="<?php echo $popup_found_cheaper_data['notify_email']; ?>" id="input-notify_email" class="form-control" />
                  <?php if ($error_notify_email) { ?>
                    <div class="text-danger"><?php echo $error_notify_email; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
                <div class="col-sm-10">
                  <select name="popup_found_cheaper_data[name]" id="input-name" class="form-control">
                    <?php if ($popup_found_cheaper_data['name'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } elseif ($popup_found_cheaper_data['name'] == 2) { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2" selected="selected"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
                <div class="col-sm-10">
                  <select name="popup_found_cheaper_data[telephone]" id="input-telephone" class="form-control">
                    <?php if ($popup_found_cheaper_data['telephone'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } elseif ($popup_found_cheaper_data['telephone'] == 2) { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2" selected="selected"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-comment"><?php echo $entry_comment; ?></label>
                <div class="col-sm-10">
                  <select name="popup_found_cheaper_data[comment]" id="input-comment" class="form-control">
                    <?php if ($popup_found_cheaper_data['comment'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } elseif ($popup_found_cheaper_data['comment'] == 2) { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2" selected="selected"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-link"><?php echo $entry_link; ?></label>
                <div class="col-sm-10">
                  <select name="popup_found_cheaper_data[link]" id="input-link" class="form-control">
                    <?php if ($popup_found_cheaper_data['link'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } elseif ($popup_found_cheaper_data['link'] == 2) { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2" selected="selected"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="display-tab">
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_color_send_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_found_cheaper_data[color_send_button]" value="<?php echo $popup_found_cheaper_data['color_send_button']; ?>" placeholder="<?php echo $entry_color_send_button; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_color_close_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_found_cheaper_data[color_close_button]" value="<?php echo $popup_found_cheaper_data['color_close_button']; ?>" placeholder="<?php echo $entry_color_close_button; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_background_send_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_found_cheaper_data[background_send_button]" value="<?php echo $popup_found_cheaper_data['background_send_button']; ?>" placeholder="<?php echo $entry_background_send_button; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_background_close_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_found_cheaper_data[background_close_button]" value="<?php echo $popup_found_cheaper_data['background_close_button']; ?>" placeholder="<?php echo $entry_background_close_button; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_background_send_button_hover; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_found_cheaper_data[background_send_button_hover]" value="<?php echo $popup_found_cheaper_data['background_send_button_hover']; ?>" placeholder="<?php echo $entry_background_send_button_hover; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_background_close_button_hover; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_found_cheaper_data[background_close_button_hover]" value="<?php echo $popup_found_cheaper_data['background_close_button_hover']; ?>" placeholder="<?php echo $entry_background_close_button_hover; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_border_send_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_found_cheaper_data[border_send_button]" value="<?php echo $popup_found_cheaper_data['border_send_button']; ?>" placeholder="<?php echo $entry_border_send_button; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_border_close_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_found_cheaper_data[border_close_button]" value="<?php echo $popup_found_cheaper_data['border_close_button']; ?>" placeholder="<?php echo $entry_border_close_button; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_border_send_button_hover; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_found_cheaper_data[border_send_button_hover]" value="<?php echo $popup_found_cheaper_data['border_send_button_hover']; ?>" placeholder="<?php echo $entry_border_send_button_hover; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_border_close_button_hover; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_found_cheaper_data[border_close_button_hover]" value="<?php echo $popup_found_cheaper_data['border_close_button_hover']; ?>" placeholder="<?php echo $entry_border_close_button_hover; ?>" class="form-control color" />
                </div>
              </div>
            </div>
            <div class="tab-pane" id="list-tab">
              <div id="history"></div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
$(function(){
  $('input.color').minicolors();
});

$('#history').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();
  $('#history').load(this.href);
});
$('#history').load('index.php?route=module/popup_found_cheaper/history&token=<?php echo $token; ?>');

function delete_selected(request_id) {
  $.ajax({
    type: 'post',
    url:  'index.php?route=module/popup_found_cheaper/delete_selected&token=<?php echo $token; ?>&delete=' + request_id,
    dataType: 'json',
    success: function(json) {
      $('#history').load('index.php?route=module/popup_found_cheaper/history&token=<?php echo $token; ?>');
    }
  });
}
function delete_all() {
  $.ajax({
    type: 'get',
    url:  'index.php?route=module/popup_found_cheaper/delete_all&token=<?php echo $token; ?>',
    dataType: 'json',
    success: function(json) {
      $('#history').load('index.php?route=module/popup_found_cheaper/history&token=<?php echo $token; ?>');
    }
  });
}
function delete_all_selected() {
  $.ajax({
    type: 'post',
    url:  'index.php?route=module/popup_found_cheaper/delete_all_selected&token=<?php echo $token; ?>',
    data: $('#history input[type=\'checkbox\']:checked'),
    dataType: 'json',
    success: function(json) {
      $('#history').load('index.php?route=module/popup_found_cheaper/history&token=<?php echo $token; ?>');
    }
  });
}
function update_note(request_id, note) {
  $.ajax({
    type: 'post',
    url:  'index.php?route=module/popup_found_cheaper/update_note&token=<?php echo $token; ?>&request_id=' + request_id + '&note=' + note,
    dataType: 'json',
    success: function(json) {
      $('#history').load('index.php?route=module/popup_found_cheaper/history&token=<?php echo $token; ?>');
    }
  });
}
</script>
<?php echo $footer; ?>