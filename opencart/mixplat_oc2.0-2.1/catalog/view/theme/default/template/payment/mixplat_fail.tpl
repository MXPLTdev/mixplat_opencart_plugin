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
 <p><?php echo $fail_text; ?></p>
 <div class="buttons">
 <div class="pull-right"><a href="<?php echo $button_ok_url;?>" class="btn btn-primary"><?php echo $button_ok; ?></a></div>
</div>
<?php echo $content_bottom; ?></div>
<?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>