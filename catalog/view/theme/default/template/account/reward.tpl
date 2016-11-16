<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <p id="total"><?php echo $text_total; ?> <b><?php echo $total; ?></b></p>
      <ul class="nav nav-tabs">
        <li class="active"><a href="#tab-rewards" data-toggle="tab"><?php echo $tab_rewards; ?></a></li>
        <li><a href="#tab-coupons" data-toggle="tab"><?php echo $tab_coupons; ?></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tab-rewards">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td class="text-left"><?php echo $column_date_added; ?></td>
                  <td class="text-left"><?php echo $column_description; ?></td>
                  <td class="text-right"><?php echo $column_points; ?></td>
                </tr>
              </thead>
              <tbody id="rewards">
                <?php if ($rewards) { ?>
                <?php foreach ($rewards  as $reward) { ?>
                <tr>
                  <td class="text-left"><?php echo $reward['date_added']; ?></td>
                  <td class="text-left"><?php if ($reward['order_id']) { ?>
                    <a href="<?php echo $reward['href']; ?>"><?php echo $reward['description']; ?></a>
                    <?php } else { ?>
                    <?php echo $reward['description']; ?>
                    <?php } ?></td>
                  <td class="text-right"><?php echo $reward['points']; ?></td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="3"><?php echo $text_empty; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
          <div class="row">
            <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
            <div class="col-sm-6 text-right"><?php echo $results; ?></div>
          </div>
        </div>

        <div class="tab-pane" id="tab-coupons">
          <h3><?php echo $text_my_coupons; ?></h3>
          <div class="row" id="my_coupons">
          <?php if ($cus_coupons) { ?>
            <?php foreach ($cus_coupons as $coupon) { ?>
            <div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
              <?php if ($coupon['order_id']) { $class=" used"; } ?>
              <div class="coupon-thumb transition<?php echo $class; ?>">
                <h4 class="coupon-caption text-center"><?php echo $coupon['caption']; ?></h4>
                <p class="coupon-description"><?php echo $coupon['description']; ?></p>
                <p class="coupon-code"><?php echo $text_cupon_code . $coupon['code']; ?>
                  <?php if ($coupon['order_id']) { ?>
                  &nbsp;<i class="fa fa-archive" data-toggle="tooltip" data-placement="top" data-html="true" title="<?php echo $coupon['order_id']; ?><br/><?php echo $text_used . $coupon['date_used']; ?>"></i>
                  <?php } ?>
                </p>
              </div>
            </div>
            <?php } ?>
          <?php } else { ?>
            <p id="non_coupon" class="text-center"><?php echo $text_no_cupons; ?></p>
          <?php } ?>
          </div>
          
          <?php if ($coupons) { ?>
          <h3><?php echo $text_buy_coupons; ?></h3>
          <div class="row">
            <?php foreach ($coupons as $coupon) { ?>
            <div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
              <div class="coupon-thumb transition">
                <h4 class="coupon-caption text-center"><?php echo $coupon['caption']; ?></h4>
                <p class="coupon-description"><?php echo $coupon['description']; ?></p>
                <p class="coupon-price"><?php echo $text_coupon_price; ?>&nbsp;<?php echo $coupon['value']; ?></p>
                <div class="cart text-center">
                  <?php if ($coupon['enabled']) { ?>
                    <input type="button" class="btn btn-success" value="<?php  echo $button_buy_coupon; ?>" onclick="buyCoupone('<?php echo $coupon['id']; ?>');" />
                  <?php } else { ?>
                    <input type="button" class="btn btn-default" value="<?php  echo $button_buy_coupon; ?>" disabled="disabled" />
                  <?php } ?>
                </div>
              </div>
            </div>
            <?php } ?>

            <?php if (isset($text_not_def_currency)) { ?>
            <br/>
            <p><?php echo $text_not_def_currency; ?></p>
            <?php } ?>
          </div>
          <?php } ?>
        </div>
      </div>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>

<div class="modal fade" id="moadalCouponBuy" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close close-modal" aria-label="Close" onclick="cancelCoupone();"><span aria-hidden="true">&times;</span></button>
        <span>&nbsp;</span>
      </div>
      <div class="modal-body">
        <?php echo $text_popup; ?>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="buyCoupone" data-loading-text="<?php echo $text_work; ?>" onclick="confirmCoupone();"><?php echo $button_yes; ?></button>
        <button type="button" class="btn btn-default close-modal" onclick="cancelCoupone();"><?php echo $button_no; ?></button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript"><!--
var CouponID = -1;

//Функция отображени/скрытия PopUp
function PopUp(){
  $('#moadalCouponBuy').modal("toggle");
}

function buyCoupone(cID) {
  CouponID = cID;
  PopUp();
}	

function cancelCoupone() {
  CouponID = -1;
  PopUp();
}

  
function confirmCoupone() {
  $.ajax({
    url: 'index.php?route=account/reward/add',
    type: 'post',
    data: 'coupon_id=' + CouponID,
    dataType: 'json',
      beforeSend: function() {
        $('.alert').remove();
        $('#buyCoupone').button('loading');
        $('.close-modal').attr('disabled', true);
      },
      complete: function() {
        $('#buyCoupone').button('reset');
        $('.close-modal').attr('disabled', false);
        PopUp();
      },
      success: function(json) {
        $('.success, .warning').remove();
        
        //begin sergius_sv
        if (json['error']) {
          $('#content').parent().before('<div class="alert alert-danger">' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
            
          $('html, body').animate({ scrollTop: 0 }, 'slow'); 
        } 
        //end sergius_sv
        
        if (json['success']) {
          if (json['success']['text']) {
            $('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success']['text'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
          };
          
          var html = '';
          
          if (json['success']['result']) {
            $('#total').html(json['success']['result']['total']);

            html = '<tr>';
            html +='  <td class="text-left">' + json['success']['result']['date'] + '</td>';
            html +='  <td class="text-left">' + json['success']['result']['descr'] + '</td>';
            html +='  <td class="text-right">' + json['success']['result']['points'] + '</td>';
            html +='</tr>';
            $('#rewards').prepend(html);
          };
          
          if (json['success']['coupon']) {
            if (document.getElementById('non_coupon')) {
              $('#non_coupon').remove();
            }
            
            html  = '<div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12" id="' + json['success']['coupon']['code'] + ' style="display: none;">';
            html += '  <div class="coupon-thumb transition">';
            html += '    <h4 class="coupon-caption text-center">' + json['success']['coupon']['caption'] + '</h4>';
            html += '    <p class="coupon-description">' + json['success']['coupon']['description'] + '</p>';
            html += '    <p class="coupon-code">' + json['success']['coupon']['code'] + '</p>';
            html += '  </div>';
            html += '</div>';
            
            $('#my_coupons').prepend(html);
            $('#'+json['success']['coupon']['code']+'').fadeIn('slow');
          }
        }	
      }
  });
}
//--></script> 


<?php echo $footer; ?>