<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
	  <div class="pull-right"><a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-filter').submit() : false;"><i class="fa fa-trash-o"></i></button>
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
		<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-filter">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr class="table-pagination">
				  <td colspan="4">
					<div class="pull-left"><?php echo $pagination; ?></div>
					<?php if ($pagination) { ?>
					  <div class="pull-right pagination-text"><?php echo $results; ?></div>
					  <?php } else { ?>
					  <div class="pull-right"><?php echo $results; ?></div>
					<?php } ?>
				  </td>
				</tr>
				<tr>
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td class="text-left"><?php if ($sort == 'fgd.name') { ?>
                    <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_group; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_name; ?>"><?php echo $column_group; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-right"><?php if ($sort == 'fg.sort_order') { ?>
                    <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-center" style="min-width: 90px; width: 90px;"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($filters) { ?>
                <?php foreach ($filters as $filter) { ?>
                <tr>
                  <td class="text-center"><?php if (in_array($filter['filter_group_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $filter['filter_group_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $filter['filter_group_id']; ?>" />
                    <?php } ?></td>
                  <?php if ($admin_quick_edit_filter_name) { ?>
				    <td class="text-left"><a onclick="getName('<?php echo $filter['filter_group_id']; ?>');" data-toggle="popover-maxy" data-target="#filter-name-<?php echo $filter['filter_group_id']; ?>" data-placement="top top-left" id="filter-name<?php echo $filter['filter_group_id']; ?>" class="btn-hover-list"><?php echo $filter['name']; ?></a></td>
				    <?php } else { ?>
				    <td class="text-left"><?php echo $filter['name']; ?></td>
				  <?php } ?>
                  <?php if ($admin_quick_edit_filter_sortorder) { ?>
				    <td class="text-right"><a data-toggle="popover-maxy" data-target="#filter-sort-<?php echo $filter['filter_group_id']; ?>" data-placement="top top-right" id="filter-sort<?php echo $filter['filter_group_id']; ?>" class="btn btn-default btn-sm"><?php echo $filter['sort_order']; ?></a></td>
                    <?php } else { ?>
					<td class="text-right"><?php echo $filter['sort_order']; ?></td>
                  <?php } ?>
                  <td class="text-center">
				    <?php if ($admin_quick_edit_filter_value) { ?><a onclick="editFilterValue('<?php echo $filter['filter_group_id']; ?>');" data-toggle="tooltip" title="<?php echo $text_filter_value; ?>" class="btn btn-warning btn-sm"><i class="fa fa-star-o fa-lg"></i></a><?php } ?>
					<a href="<?php echo $filter['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary btn-sm"><i class="fa fa-pencil fa-fw"></i></a>
				  </td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="4"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
			  <tfoot>
			    <tr>
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td class="text-left"><?php if ($sort == 'fgd.name') { ?>
                    <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_group; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_name; ?>"><?php echo $column_group; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-right"><?php if ($sort == 'fg.sort_order') { ?>
                    <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-center"><?php echo $column_action; ?></td>
                </tr>
				<tr class="table-pagination">
				  <td colspan="4">
					<div class="pull-left"><?php echo $pagination; ?></div>
					<?php if ($pagination) { ?>
					  <div class="pull-right pagination-text"><?php echo $results; ?></div>
					  <?php } else { ?>
					  <div class="pull-right"><?php echo $results; ?></div>
					<?php } ?>
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
<div id="modal-filter-edit" class="modal fade">
  <div class="modal-dialog modal-lg animated zoomIn">
    <div class="modal-content">
	  <div id="modal-filter-content"></div>
	</div>
  </div>
</div>
<?php foreach ($filters as $filter) { ?>
  <div id="filter-name-<?php echo $filter['filter_group_id']; ?>" class="popover popover-md popover-primary animated-fast zoomIn" style="height: 198px !important;">
    <div class="arrow"></div>
	<h3 class="popover-title"><?php echo $column_group; ?><a id="close-name-<?php echo $filter['filter_group_id']; ?>" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
    <div id="filter-name-content-<?php echo $filter['filter_group_id']; ?>"></div>
  </div>
  <div id="filter-sort-<?php echo $filter['filter_group_id']; ?>" class="popover popover-primary animated-fast zoomIn">
    <div class="arrow"></div><h3 class="popover-title"><?php echo $column_sort_order; ?>
    <a id="close-sort-<?php echo $filter['filter_group_id']; ?>" data-dismiss="popover-maxy" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
    <div class="popover-content">
      <form class="form-vertical">
	    <div class="row">
          <div class="col-sm-12">
            <input type="text" name="sort_order" value="<?php echo $filter['sort_order']; ?>" placeholder="<?php echo $column_sort_order; ?>" id="input-sort<?php echo $filter['filter_group_id']; ?>" class="form-control" />
          </div>
	    </div>
      </form>
    </div>
    <div class="popover-footer">
      <a onclick="editSort('<?php echo $filter['filter_group_id']; ?>');" class="btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a><a onclick="sortClear('<?php echo $filter['filter_group_id']; ?>');" class="btn btn-danger btn-sm"><i class="fa fa-eraser fa-fw"></i></a>
    </div>
  </div> 
<?php } ?>
<?php echo $footer; ?>