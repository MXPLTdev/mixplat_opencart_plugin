<?php echo $header; ?>
<style type="text/css">
.col-sm-3, .col-sm-2{
  float: left;
  margin: 0px  20px ;
}
.row {
  width: 320px;
  clear: both;
}
.fa-plus:after {
  content: "Добавить";
}
.fa-trash-o:after {
  content: "Удалить";
}
</style>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/payment.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i><?php echo $entry_reg; ?></h3>
      </div>
      <!--div class="panel-body" -->
        <h3><?php echo $entry_modinfo; ?></h3>
        <p><?php echo $entry_modver; ?> <?php echo $version ?><br>
        <?php echo $entry_shopver; ?> Opencart <?php echo $shopversion ?></p>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
          <table class="form">  
        <tr>
        <td><?php echo $entry_status; ?></td>
        <td><select name="<?php echo $pname; ?>_status">
            <?php if ($mixplatpro_status) { ?>
            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
            <option value="0"><?php echo $text_disabled; ?></option>
            <?php } else { ?>
            <option value="1"><?php echo $text_enabled; ?></option>
            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
            <?php } ?>
          </select></td>
        </tr>
        <tr>
          <td width="25%"><?php echo $entry_server; ?><br><small><?php echo $help_server; ?></small></td>
          <td><?php if ($mixplatpro_server) { ?>
            <input type="radio" name="<?php echo $pname; ?>_server" value="0" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_server" value="1" checked="checked" />
            <?php echo $text_no; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_server" value="0" checked="checked" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_server" value="1" />
            <?php echo $text_no; ?>
            <?php } ?></td>
        </tr>    
        <tr>
          <td><?php echo $entry_debug; ?><br><small><?php echo $help_debug; ?></small></td>
          <td><?php if ($mixplatpro_debug) { ?>
            <input type="radio" name="<?php echo $pname; ?>_debug" value="1" checked="checked" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_debug" value="0" />
            <?php echo $text_no; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_debug" value="1" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_debug" value="0" checked="checked" />
            <?php echo $text_no; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_name_tab; ?></td>
          <td><?php if ($mixplatpro_name_attach) { ?>
            <input id="named_tab" type="radio" name="<?php echo $pname; ?>_name_attach" value="0" />
            <?php echo $text_default; ?>
            <input id="namep_tab" type="radio" name="<?php echo $pname; ?>_name_attach" value="1" checked="checked" />
            <?php echo $entry_proizvol; ?>
            <?php } else { ?>
            <input id="named_tab" type="radio" name="<?php echo $pname; ?>_name_attach" value="0" checked="checked" />
            <?php echo $text_default; ?>
            <input id="namep_tab" type="radio" name="<?php echo $pname; ?>_name_attach" value="1" />
            <?php echo $entry_proizvol; ?>
            <?php } ?>
            <br><br>
            <textarea class="hidedname" <?php if ($mixplatpro_name_attach) {?>style="display:none;"<?php } ?> cols="50" rows="1" disabled><?php echo $entry_name_ro; ?></textarea>
            <span class="hidename" <?php if (!$mixplatpro_name_attach) {?>style="display:none;"<?php } ?>><?php foreach ($languages as $language) { ?><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align:top;"/> <textarea name="<?php echo $pname; ?>_name_<?php echo $language['language_id']; ?>" cols="50" rows="1"><?php echo isset(${'mixplatpro_name_' . $language['language_id']}) ? ${'mixplatpro_name_' . $language['language_id']} : ''; ?></textarea>
            <?php if (${'error_name_' . $language['language_id']}) { ?><br />
              <span class="error"><?php echo ${'error_name_' . $language['language_id']}; ?></span>
            <?php } ?>
              <br />
            <?php } ?></span>
          </td>
        </tr>
      </table>
      <table class="form">
        <h3><?php echo $entry_kabinfo; ?></h3>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_password; ?></td>
          <td><input type="password" name="<?php echo $pname; ?>_password" value="<?php if (isset($mixplatpro_password)){ echo $mixplatpro_password; }?>" />
          <br />
          <?php if ($error_password) { ?>
          <span class="error"><?php echo $error_password; ?></span>
          <?php } ?></td>
        </tr>
        <td width="25%"><span class="required">*</span> <?php echo $entry_project_id; ?></td>
          <td><input type="text" name="<?php echo $pname; ?>_project_id" value="<?php if (isset($mixplatpro_project_id)){ echo $mixplatpro_project_id; }?>" />
          <br />
          <?php if ($error_project_id) { ?>
          <span class="error"><?php echo $error_project_id; ?></span>
          <?php } ?></td>
      	</tr>
        <tr>
          <td width="25%"><span class="required">*</span> <?php echo $entry_payment_form_id; ?></td>
          <td><input type="text" name="<?php echo $pname; ?>_payment_form_id" value="<?php if (isset($mixplatpro_payment_form_id)){ echo $mixplatpro_payment_form_id; }?>" />
          <br />
          <?php if ($error_payment_form_id) { ?>
          <span class="error"><?php echo $error_payment_form_id; ?></span>
          <?php } ?></td>
        </tr>
        </table>
        <table class="form">
        <h3><?php echo $entry_payinfo; ?></h3>
        <?php if ($twostage_show === true) { ?>
        <tr>
          <td width="25%"><?php echo $entry_twostage; ?><br><small><?php echo $help_twostage; ?></small></td>
          <td><?php if ($mixplatpro_twostage) { ?>
            <input type="radio" name="<?php echo $pname; ?>_twostage" value="0" />
            <?php echo $text_onestage; ?>
            <input type="radio" name="<?php echo $pname; ?>_twostage" value="1" checked="checked" />
            <?php echo $text_twostage; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_twostage" value="0" checked="checked" />
            <?php echo $text_onestage; ?>
            <input type="radio" name="<?php echo $pname; ?>_twostage" value="1" />
            <?php echo $text_twostage; ?>
            <?php } ?></td>
        </tr>
        <?php } ?>
        <tr>
          <td><?php echo $entry_otlog ; ?><br><small><?php echo $help_otlog; ?></small></td>
          <td><?php if ($mixplatpro_otlog == 'pay') { ?>
            <input type="radio" name="<?php echo $pname; ?>_otlog" id="standard_tab" value="0" />
            <?php echo $entry_otlog_standard; ?>
            <input type="radio" name="<?php echo $pname; ?>_otlog" id="pay_tab" value="pay" checked="checked" />
            <?php echo $entry_otlog_pay; ?>
            <input type="radio" name="<?php echo $pname; ?>_otlog" id="stock_tab" value="stock" />
            <?php echo $entry_otlog_stock; ?>
            <?php } else if($mixplatpro_otlog == 'stock'){ ?>
            <input type="radio" name="<?php echo $pname; ?>_otlog" id="standard_tab" value="0" />
            <?php echo $entry_otlog_standard; ?>
            <input type="radio" name="<?php echo $pname; ?>_otlog" id="pay_tab" value="pay" />
            <?php echo $entry_otlog_pay; ?>
            <input type="radio" name="<?php echo $pname; ?>_otlog" id="stock_tab" value="stock" checked="checked" />
            <?php echo $entry_otlog_stock; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_otlog" id="standard_tab" value="0" checked="checked" />
            <?php echo $entry_otlog_standard; ?>
            <input type="radio" name="<?php echo $pname; ?>_otlog" id="pay_tab" value="pay" />
            <?php echo $entry_otlog_pay; ?>
            <input type="radio" name="<?php echo $pname; ?>_otlog" id="stock_tab" value="stock" />
            <?php echo $entry_otlog_stock; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_komis; ?></td>
          <td><input type="text" name="<?php echo $pname; ?>_komis" value="<?php echo isset($mixplatpro_komis) ? $mixplatpro_komis : ''; ?>" >%</td>
        </tr>
        <tr>
          <td><?php echo $entry_fixen ; ?></td>
          <td><?php if ($mixplatpro_fixen == 'proc') { ?>
            <input id="fixen0_tab" type="radio" name="<?php echo $pname; ?>_fixen" value="0" />
            <?php echo $entry_fixen_order; ?>
            <input id="fixenP_tab" type="radio" name="<?php echo $pname; ?>_fixen" value="proc" checked="checked" />
            <?php echo $entry_fixen_proc; ?>
            <input id="fixenF_tab" type="radio" name="<?php echo $pname; ?>_fixen" value="fix" />
            <?php echo $entry_fixen_fix; ?>
            <?php } else if($mixplatpro_fixen == 'fix'){ ?>
            <input id="fixen0_tab" type="radio" name="<?php echo $pname; ?>_fixen" value="0" />
            <?php echo $entry_fixen_order; ?>
            <input id="fixenP_tab" type="radio" name="<?php echo $pname; ?>_fixen" value="proc" />
            <?php echo $entry_fixen_proc; ?>
            <input id="fixenF_tab" type="radio" name="<?php echo $pname; ?>_fixen" value="fix" checked="checked" />
            <?php echo $entry_fixen_fix; ?>
            <?php } else { ?>
            <input id="fixen0_tab" type="radio" name="<?php echo $pname; ?>_fixen" value="0" checked="checked" />
            <?php echo $entry_fixen_order; ?>
            <input id="fixenP_tab" type="radio" name="<?php echo $pname; ?>_fixen" value="proc" />
            <?php echo $entry_fixen_proc; ?>
            <input id="fixenF_tab" type="radio" name="<?php echo $pname; ?>_fixen" value="fix" />
            <?php echo $entry_fixen_fix; ?>
            <?php } ?></td>
        </tr>
        <tr class="hidefixen"<?php if (!$mixplatpro_fixen) { ?> style="display:none;"<?php } ?>>
          <td>
            <span class="langfixenP"<?php if ($mixplatpro_fixen != 'proc') { ?> style="display:none;"<?php } ?>><?php echo $entry_fixen_amount; ?></span>
            <span class="langfixenF"<?php if ($mixplatpro_fixen != 'fix') { ?> style="display:none;"<?php } ?>><?php echo $entry_fixen_amount2; ?></span>
          </td>
          <td><input type="text" name="<?php echo $pname; ?>_fixen_amount" value="<?php echo isset($mixplatpro_fixen_amount) ? $mixplatpro_fixen_amount : ''; ?>" >
            <span class="langfixenP"<?php if ($mixplatpro_fixen != 'proc') { ?> style="display:none;"<?php } ?>>%</span>
            <span class="langfixenF"<?php if ($mixplatpro_fixen != 'fix') { ?> style="display:none;"<?php } ?>>руб.</span>
            <br />
          <?php if ($error_fixen) { ?>
          <span class="error"><?php echo $error_fixen; ?></span>
          <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_button_later; ?><br><small><?php echo $help_button_later; ?></small></td>
          <td><?php if ($mixplatpro_button_later) { ?>
            <input type="radio" name="<?php echo $pname; ?>_button_later" value="1" checked="checked" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_button_later" value="0" />
            <?php echo $text_no; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_button_later" value="1" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_button_later" value="0" checked="checked" />
            <?php echo $text_no; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_geo_zone; ?></td>
          <td><select name="<?php echo $pname; ?>_geo_zone_id">
            <option value="0"><?php echo $text_all_zones; ?></option>
            <?php foreach ($geo_zones as $geo_zone) { ?>
            <?php if ($geo_zone['geo_zone_id'] == $mixplatpro_geo_zone_id) { ?>
            <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></td>
        </tr>
        <tr>
          <td><?php echo $entry_sort_order; ?></td>
          <td><input type="text" name="<?php echo $pname; ?>_sort_order" value="<?php echo $mixplatpro_sort_order; ?>" size="1" /></td>
        </tr>
      </table>
      <table class="form">
        <h3><?php echo $entry_fzinfo; ?></h3> 
        <tr>
          <td width="25%"><?php echo $entry_cart; ?><br><small><?php echo $help_cart; ?></small></td>
          <td><?php if ($mixplatpro_cart) { ?>
            <input id="cartOn_tab" type="radio" name="<?php echo $pname; ?>_cart" value="0" />
            <?php echo $entry_cart_on; ?>
            <input id="cartOff_tab" type="radio" name="<?php echo $pname; ?>_cart" value="1" checked="checked" />
            <?php echo $entry_cart_off; ?>
            <?php } else { ?>
            <input id="cartOn_tab" type="radio" name="<?php echo $pname; ?>_cart" value="0" checked="checked" />
            <?php echo $entry_cart_on; ?>
            <input id="cartOff_tab" type="radio" name="<?php echo $pname; ?>_cart" value="1" />
            <?php echo $entry_cart_off; ?>
            <?php } ?></td>
        </tr>
      </table>
      <table class="hide54 table" <?php if ($mixplatpro_cart) { ?> style="display:none;"<?php } ?>>
        <tr>
          <td width="25%"><?php echo $entry_tax_system_code ; ?></td>
          <td>
            <?php if ($mixplatpro_tax_system_code == '2'){ ?>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="1" />
            <?php echo $text_tax_system_code_1; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="2" checked="checked"/>
            <?php echo $text_tax_system_code_2; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="3" />
            <?php echo $text_tax_system_code_3; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="4" />
            <?php echo $text_tax_system_code_4; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="5" />
            <?php echo $text_tax_system_code_5; ?><br/>
            <?php } else if ($mixplatpro_tax_system_code == '1'){ ?>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="1" checked="checked" />
            <?php echo $text_tax_system_code_1; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="2" />
            <?php echo $text_tax_system_code_2; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="3" />
            <?php echo $text_tax_system_code_3; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="4" />
            <?php echo $text_tax_system_code_4; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="5" />
            <?php echo $text_tax_system_code_5; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="6" />
            <?php echo $text_tax_system_code_6; ?>
            <?php } else if ($mixplatpro_tax_system_code == '3'){ ?>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="1" />
            <?php echo $text_tax_system_code_1; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="2" />
            <?php echo $text_tax_system_code_2; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="3" checked="checked" />
            <?php echo $text_tax_system_code_3; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="4" />
            <?php echo $text_tax_system_code_4; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="5" />
            <?php echo $text_tax_system_code_5; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="6" />
            <?php echo $text_tax_system_code_6; ?>
            <?php } else if ($mixplatpro_tax_system_code == '4'){ ?>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="1" />
            <?php echo $text_tax_system_code_1; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="2" />
            <?php echo $text_tax_system_code_2; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="3" />
            <?php echo $text_tax_system_code_3; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="4" checked="checked" />
            <?php echo $text_tax_system_code_4; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="5" />
            <?php echo $text_tax_system_code_5; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="6" />
            <?php echo $text_tax_system_code_6; ?>
            <?php } else if ($mixplatpro_tax_system_code == '5'){ ?>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="1" />
            <?php echo $text_tax_system_code_1; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="2" />
            <?php echo $text_tax_system_code_2; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="3" />
            <?php echo $text_tax_system_code_3; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="4" />
            <?php echo $text_tax_system_code_4; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="5" checked="checked" />
            <?php echo $text_tax_system_code_5; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="6" />
            <?php echo $text_tax_system_code_6; ?>
            <?php } else if ($mixplatpro_tax_system_code == '6'){ ?>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="1" />
            <?php echo $text_tax_system_code_1; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="2" />
            <?php echo $text_tax_system_code_2; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="3" />
            <?php echo $text_tax_system_code_3; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="4" />
            <?php echo $text_tax_system_code_4; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="5" />
            <?php echo $text_tax_system_code_5; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="6" checked="checked" />
            <?php echo $text_tax_system_code_6; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="1" />
            <?php echo $text_tax_system_code_1; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="2" checked="checked" />
            <?php echo $text_tax_system_code_2; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="3" />
            <?php echo $text_tax_system_code_3; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="4" />
            <?php echo $text_tax_system_code_4; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="5"/>
            <?php echo $text_tax_system_code_5; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_tax_system_code" value="6" />
            <?php echo $text_tax_system_code_6; ?>
            <?php } ?></td>
        </tr>
        <tr class="nonds" <?php if ($mixplatpro_tax_system_code == '1') {?>style="display:none;"<?php } ?>>
          <td><?php echo $entry_nds_important ; ?></td>
          <td>
            <input type="radio" name="<?php echo $pname; ?>_nds_important" value="6"  checked="checked"/>
            <?php echo $entry_nds_important_6; ?>
          </td>
        </tr>
        <tr class="nds" <?php if ($mixplatpro_tax_system_code != '1') {?>style="display:none;"<?php } ?>>
          <td><?php echo $entry_nds_important ; ?><br><small><?php echo $help_nds_important; ?></small></td>
          <td>
            <?php $pole = 'tax'; ?>
            <select name="<?php echo $pname; ?>_nds_important">
            <?php foreach ($manypoles[$pole] as $ar) { ?>
            <?php if ($mixplatpro_nds_important == $ar) { ?>
              <option value="<?php echo $ar; ?>" selected="selected"/><?php echo ${"entry_nds_important_{$ar}"}; ?></option>
            <?php } else { ?>
              <option value="<?php echo $ar; ?>" /><?php echo ${"entry_nds_important_{$ar}"}; ?></option>
            <?php } ?>
            <?php } ?>
            </select>
          </td>
        </tr>
        <tr class="nds" <?php if ($mixplatpro_tax_system_code != '1') {?>style="display:none;"<?php } ?>>
          <td><?php echo $entry_nds ; ?></td>
          <td><?php if ($mixplatpro_nds == 'important') { ?>
            <input type="radio" name="<?php echo $pname; ?>_nds" id="tovar_tab" value="tovar" />
            <?php echo $entry_nds_tovar; ?>
            <input type="radio" name="<?php echo $pname; ?>_nds" id="important_tab" value="important" checked="checked" />
            <?php echo $text_no; ?>
            <?php } else if($mixplatpro_nds == 'tovar'){ ?>
            <input type="radio" name="<?php echo $pname; ?>_nds" id="tovar_tab" value="tovar" checked="checked" />
            <?php echo $entry_nds_tovar; ?>
            <input type="radio" name="<?php echo $pname; ?>_nds" id="important_tab" value="important" />
            <?php echo $text_no; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_nds" id="tovar_tab" value="tovar" checked="checked" />
            <?php echo $entry_nds_tovar; ?>
            <input type="radio" name="<?php echo $pname; ?>_nds" id="important_tab" value="important" />
            <?php echo $text_no; ?>
            <?php } ?></td>
        </tr>
        <tr class="nds hidetovar" <?php if ($mixplatpro_tax_system_code != '1') {?>style="display:none;"<?php } ?>>

          <td><?php echo $entry_tax; ?><br><small><?php echo $help_tax; ?></small></td>
          <td>
            
            <?php $class_row = 0; ?>
          <?php foreach ($mixplatpro_classes as $class) { ?>
          <?php if ($class_row > 0) { ?>
          <label class="control-label class-row<?php echo $class_row; ?>"></label>
          <?php } ?>
          <div class="row rule_tax class-row<?php echo $class_row; ?>">
            <div class="col-sm-3">
              <select name="<?php echo $pname; ?>_classes[<?php echo $class_row; ?>][<?php echo $pname; ?>_nalog]" class="form-control">
                <?php foreach ($tax_classes as $tax_class) { ?>
                <option <?php echo $tax_class['tax_class_id'] == $class[$pname.'_nalog'] ? 'selected' : ''; ?> value="<?php echo $tax_class['tax_class_id'];?>"><?php echo $tax_class['title'];?></option>
                <?php } ?>
              </select>
            </div>
            <div class="col-sm-3">
              <select name="<?php echo $pname; ?>_classes[<?php echo $class_row; ?>][<?php echo $pname; ?>_tax_rule]" class="form-control">
                <?php foreach ($tax_rules as $tax) { ?>
                <option <?php echo $tax['id'] == $class[$pname.'_tax_rule'] ? 'selected' : ''; ?> value="<?php echo $tax['id'];?>"><?php echo $tax['name'];?></option>
                <?php } ?>
              </select>
            </div>
            <?php if ($class_row > 0) { ?>
            <div class="col-sm-1">
              <button type="button" onclick="$('.class-row<?php echo $class_row; ?>').remove();" class="btn btn-primary button_remove_rule_tax">Удалить</button>
            </div>
            <?php } ?>
            <?php $class_row++; ?>
          </div>
          <?php } ?>
          <label class="control-label"></label>
          <div class="row">
            <div class="col-sm-2">
              <button type="button" id="button_add_taxt_rule" onclick="addClassRow()" class="btn btn-primary"><i class="fa fa-plus"></i></button>
            </div>
          </div>
          </td>
        </tr>
        <tr>
          <td><?php echo $entry_customShip; ?><br><small><?php echo $help_customShip; ?></small></td>
          <td><input name="<?php echo $pname; ?>_customShip" value="<?php if (isset($mixplatpro_customShip)){ echo $mixplatpro_customShip; }?>" /></td>
        </tr>
        <tr>
          <td><?php echo $entry_show_free_shipping; ?><br><small><?php echo $help_show_free_shipping; ?></small></td>
          <td><?php if ($mixplatpro_show_free_shipping) { ?>
            <input type="radio" name="<?php echo $pname; ?>_show_free_shipping" value="1" checked="checked" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_show_free_shipping" value="0" />
            <?php echo $text_no; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_show_free_shipping" value="1" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_show_free_shipping" value="0" checked="checked" />
            <?php echo $text_no; ?>
            <?php } ?></td>
        </tr>
        <tr class="nonds" <?php if ($mixplatpro_tax_system_code == '1') {?>style="display:none;"<?php } ?>>
          <td><?php echo $entry_shipping_tax ; ?></td>
          <td>
            <input type="radio" name="<?php echo $pname; ?>_shipping_tax" value="6"  checked="checked"/>
            <?php echo $entry_nds_important_6; ?>
          </td>
        </tr>
        <tr class="nds" <?php if ($mixplatpro_tax_system_code != '1') {?>style="display:none;"<?php } ?>>
          <?php $pole = 'tax'; ?>
          <td><?php echo $entry_shipping_tax; ?></td>
          <td>
            <select name="<?php echo $pname; ?>_shipping_tax">
            <?php foreach ($manypoles[$pole] as $ar) { ?>
            <?php if ($mixplatpro_shipping_tax == $ar) { ?>
              <option value="<?php echo $ar; ?>" selected="selected"/><?php echo ${"entry_nds_important_{$ar}"}; ?></option>
            <?php } else { ?>
              <option value="<?php echo $ar; ?>" /><?php echo ${"entry_nds_important_{$ar}"}; ?></option>
            <?php } ?>
            <?php } ?>
            </select>
          </td>
        </tr>
        <tr>
          <?php $pole = 'payment_mode_default'; ?>
          <td><?php echo ${"entry_{$pole}"}; ?></td>
          <td>
            <select name="<?php echo $pname; ?>_<?php echo $pole; ?>">
            <?php foreach ($manypoles[$pole] as $ar) { ?>
            <?php if (${"mixplatpro_{$pole}"} == $ar) { ?>
            <option value="<?php echo $ar; ?>" selected="selected"/><?php echo ${"text_{$pole}_{$ar}"}; ?></option>
            <?php } else { ?>
              <option value="<?php echo $ar; ?>" /><?php echo ${"text_{$pole}_{$ar}"}; ?></option>
            <?php } ?>
            <?php } ?>
            </select>
          </td>
        </tr>
        <tr>
          <?php $pole = 'payment_mode_source'; ?>
          <td><?php echo ${"entry_{$pole}"}; ?><br><small><?php echo  ${"help_{$pole}"}; ?></small></td>
          <td>
            <select name="<?php echo $pname; ?>_<?php echo $pole; ?>">
            <?php foreach ($manypoles[$pole] as $ar) { ?>
            <?php if (${"mixplatpro_{$pole}"} == $ar) { ?>
            <option value="<?php echo $ar; ?>" selected="selected"/><?php echo ${"text_{$ar}"}; ?></option>
            <?php } else { ?>
              <option value="<?php echo $ar; ?>" /><?php echo ${"text_{$ar}"}; ?></option>
            <?php } ?>
            <?php } ?>
            </select>
          </td>
        </tr>
        <tr>
          <?php $pole = 'payment_subject_default'; ?>
          <td><?php echo ${"entry_{$pole}"}; ?></td>
          <td>
            <select name="<?php echo $pname; ?>_<?php echo $pole; ?>">
            <?php foreach ($manypoles[$pole] as $ar) { ?>
            <?php if (${"mixplatpro_{$pole}"} == $ar) { ?>
            <option value="<?php echo $ar; ?>" selected="selected"/><?php echo ${"text_{$pole}_{$ar}"}; ?></option>
            <?php } else { ?>
              <option value="<?php echo $ar; ?>" /><?php echo ${"text_{$pole}_{$ar}"}; ?></option>
            <?php } ?>
            <?php } ?>
            </select>
          </td>
        </tr>
        <tr>
          <?php $pole = 'payment_subject_source'; ?>
          <td><?php echo ${"entry_{$pole}"}; ?><br><small><?php echo  ${"help_{$pole}"}; ?></small></td>
          <td>
            <select name="<?php echo $pname; ?>_<?php echo $pole; ?>">
            <?php foreach ($manypoles[$pole] as $ar) { ?>
            <?php if (${"mixplatpro_{$pole}"} == $ar) { ?>
            <option value="<?php echo $ar; ?>" selected="selected"/><?php echo ${"text_{$ar}"}; ?></option>
            <?php } else { ?>
              <option value="<?php echo $ar; ?>" /><?php echo ${"text_{$ar}"}; ?></option>
            <?php } ?>
            <?php } ?>
            </select>
          </td>
        </tr>
        <tr>
          <?php $pole = 'customName'; ?>
          <td><?php echo ${"entry_{$pole}"}; ?><br><small><?php echo  ${"help_{$pole}"}; ?></small></td>
          <td>
            <select name="<?php echo $pname; ?>_<?php echo $pole; ?>">
            <?php foreach ($manypoles[$pole] as $ar) { ?>
            <?php if (${"mixplatpro_{$pole}"} == $ar) { ?>
            <option value="<?php echo $ar; ?>" selected="selected"/><?php echo ${"text_{$ar}"}; ?></option>
            <?php } else { ?>
              <option value="<?php echo $ar; ?>" /><?php echo ${"text_{$ar}"}; ?></option>
            <?php } ?>
            <?php } ?>
            </select>
          </td>
        </tr>
      </table> 
      <table class="form"> 
        <h3><?php echo $entry_afterpay; ?></h3> 
        <tr class="hideotlog" <?php if ($mixplatpro_otlog == 'pay') {?>style="display:none;"<?php } ?>>
          <td width="25%"><?php echo $text_createorder_or_notcreate; ?><br><small><?php echo  $help_createorder_or_notcreate; ?></small></td>
          <td><?php if ($mixplatpro_createorder_or_notcreate) { ?>
            <input type="radio" name="<?php echo $pname; ?>_createorder_or_notcreate" value="1" checked="checked" id="nocreate" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_createorder_or_notcreate" value="0" id="create" />
            <?php echo $text_no; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_createorder_or_notcreate" value="1" id="nocreate" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_createorder_or_notcreate" value="0" checked="checked" id="create" />
            <?php echo $text_no; ?>
            <?php } ?></td>
       </tr>
        <tr>
          <td width="25%"><?php echo $entry_success_alert_admin_tab; ?></td>
          <td><?php if ($mixplatpro_success_alert_admin) { ?>
            <input type="radio" name="<?php echo $pname; ?>_success_alert_admin" value="0" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_success_alert_admin" value="1" checked="checked" />
            <?php echo $text_no; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_success_alert_admin" value="0" checked="checked" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_success_alert_admin" value="1" />
            <?php echo $text_no; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_success_alert_customer_tab; ?></td>
          <td><?php if ($mixplatpro_success_alert_customer) { ?>
            <input type="radio" name="<?php echo $pname; ?>_success_alert_customer" value="0" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_success_alert_customer" value="1" checked="checked" />
            <?php echo $text_no; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_success_alert_customer" value="0" checked="checked" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_success_alert_customer" value="1" />
            <?php echo $text_no; ?>
            <?php } ?></td>
        </tr>
        <tr class="showotlog" <?php if (!$mixplatpro_otlog) {?>style="display:none;"<?php } ?>>
        <td><?php echo $entry_start_status; ?></td>
        <td><select name="<?php echo $pname; ?>_start_status_id">
            <?php foreach ($order_statuses as $order_status) { ?>
            <?php if ($order_status['order_status_id'] == $mixplatpro_start_status_id) { ?>
            <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></td>
        </tr>
        <tr>
        <td>
          <span class="hideotlog"<?php if ($mixplatpro_otlog) {?> style="display:none;"<?php } ?>><?php echo $entry_on_status; ?></span>
          <span class="showotlog"<?php if (!$mixplatpro_otlog) {?> style="display:none;"<?php } ?>><?php echo $entry_on_status2; ?></span>
        </td>
        <td><select name="<?php echo $pname; ?>_on_status_id">
            <?php foreach ($order_statuses as $order_status) { ?>
            <?php if ($order_status['order_status_id'] == $mixplatpro_on_status_id) { ?>
            <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></td>
        </tr>
        <tr>
        <td><?php echo $entry_order_status; ?></td>
        <td><select name="<?php echo $pname; ?>_order_status_id">
            <?php foreach ($order_statuses as $order_status) { ?>
            <?php if ($order_status['order_status_id'] == $mixplatpro_order_status_id) { ?>
            <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></td>
        </tr>
      </table>
      <table class="form"> 
        <h3><?php echo $entry_texts; ?></h3> 
        <tr>
          <td width="25%"><?php echo $entry_instruction_tab; ?></td>
          <td><?php if ($mixplatpro_instruction_attach) { ?>
            <input type="radio" name="<?php echo $pname; ?>_instruction_attach" value="1" checked="checked" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_instruction_attach" value="0" />
            <?php echo $text_no; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_instruction_attach" value="1" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_instruction_attach" value="0" checked="checked" />
            <?php echo $text_no; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td width="25%"><?php echo $entry_instruction; ?><br><small><?php echo  $help_var; ?></small></td>
          <td><?php foreach ($languages as $language) { ?><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align:top;"/> <textarea name="<?php echo $pname; ?>_instruction_<?php echo $language['language_id']; ?>" cols="50" rows="3"><?php echo isset(${'mixplatpro_instruction_' . $language['language_id']}) ? ${'mixplatpro_instruction_' . $language['language_id']} : ''; ?></textarea><br /><?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_mail_instruction_tab; ?></td>
          <td><?php if ($mixplatpro_mail_instruction_attach) { ?>
            <input type="radio" name="<?php echo $pname; ?>_mail_instruction_attach" value="1" checked="checked" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_mail_instruction_attach" value="0" />
            <?php echo $text_no; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_mail_instruction_attach" value="1" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_mail_instruction_attach" value="0" checked="checked" />
            <?php echo $text_no; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_mail_instruction; ?><br><small><?php echo  $help_var; ?></small></td>
          <td><?php foreach ($languages as $language) { ?><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align:top;"/> <textarea name="<?php echo $pname; ?>_mail_instruction_<?php echo $language['language_id']; ?>" cols="50" rows="3"><?php echo isset(${'mixplatpro_mail_instruction_' . $language['language_id']}) ? ${'mixplatpro_mail_instruction_' . $language['language_id']} : ''; ?></textarea><br /><?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_success_comment_tab; ?></td>
          <td><?php if ($mixplatpro_success_comment_attach) { ?>
            <input type="radio" name="<?php echo $pname; ?>_success_comment_attach" value="1" checked="checked" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_success_comment_attach" value="0" />
            <?php echo $text_no; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_success_comment_attach" value="1" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_success_comment_attach" value="0" checked="checked" />
            <?php echo $text_no; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_success_comment; ?><br><small><?php echo  $help_var2; ?></small></td>
          <td><?php foreach ($languages as $language) { ?><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align:top;"/> <textarea name="<?php echo $pname; ?>_success_comment_<?php echo $language['language_id']; ?>" cols="50" rows="3"><?php echo isset(${'mixplatpro_success_comment_' . $language['language_id']}) ? ${'mixplatpro_success_comment_' . $language['language_id']} : ''; ?></textarea><br /><?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_hrefpage_tab; ?></td>
          <td><?php if ($mixplatpro_hrefpage_text_attach) { ?>
            <input type="radio" name="<?php echo $pname; ?>_hrefpage_text_attach" value="0" />
            <?php echo $text_default; ?>
            <input type="radio" name="<?php echo $pname; ?>_hrefpage_text_attach" value="1" checked="checked" />
            <?php echo $text_my; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_hrefpage_text_attach" value="0" checked="checked" />
            <?php echo $text_default; ?>
            <input type="radio" name="<?php echo $pname; ?>_hrefpage_text_attach" value="1" />
            <?php echo $text_my; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_hrefpage; ?><br><small><?php echo  $help_var; ?></small></td>
          <td><?php foreach ($languages as $language) { ?><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align:top;"/> <textarea name="<?php echo $pname; ?>_hrefpage_text_<?php echo $language['language_id']; ?>" cols="50" rows="3"><?php echo isset(${'mixplatpro_hrefpage_text_' . $language['language_id']}) ? ${'mixplatpro_hrefpage_text_' . $language['language_id']} : ''; ?></textarea><br /><?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_success_page_tab; ?></td>
          <td><?php if ($mixplatpro_success_page_text_attach) { ?>
            <input type="radio" name="<?php echo $pname; ?>_success_page_text_attach" value="0" />
            <?php echo $text_default; ?>
            <input type="radio" name="<?php echo $pname; ?>_success_page_text_attach" value="1" checked="checked" />
            <?php echo $text_my; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_success_page_text_attach" value="0" checked="checked" />
            <?php echo $text_default; ?>
            <input type="radio" name="<?php echo $pname; ?>_success_page_text_attach" value="1" />
            <?php echo $text_my; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_success_page_text; ?><br><small><?php echo  $help_var; ?></small></td>
          <td><?php foreach ($languages as $language) { ?><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align:top;"/> <textarea name="<?php echo $pname; ?>_success_page_text_<?php echo $language['language_id']; ?>" cols="50" rows="3"><?php echo isset(${'mixplatpro_success_page_text_' . $language['language_id']}) ? ${'mixplatpro_success_page_text_' . $language['language_id']} : ''; ?></textarea><br /><?php } ?></td>
        </tr>
         <tr>
          <td><?php echo $entry_waiting_page_tab; ?></td>
          <td><?php if ($mixplatpro_waiting_page_text_attach) { ?>
            <input type="radio" name="<?php echo $pname; ?>_waiting_page_text_attach" value="0" />
            <?php echo $text_default; ?>
            <input type="radio" name="<?php echo $pname; ?>_waiting_page_text_attach" value="1" checked="checked" />
            <?php echo $text_my; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_waiting_page_text_attach" value="0" checked="checked" />
            <?php echo $text_default; ?>
            <input type="radio" name="<?php echo $pname; ?>_waiting_page_text_attach" value="1" />
            <?php echo $text_my; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_waiting_page_text; ?><br><small><?php echo  $help_var; ?></small></td>
          <td><?php foreach ($languages as $language) { ?><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align:top;"/> <textarea name="<?php echo $pname; ?>_waiting_page_text_<?php echo $language['language_id']; ?>" cols="50" rows="3"><?php echo isset(${'mixplatpro_waiting_page_text_' . $language['language_id']}) ? ${'mixplatpro_waiting_page_text_' . $language['language_id']} : ''; ?></textarea><br /><?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_fail_page_tab; ?></td>
          <td><?php if ($mixplatpro_fail_page_text_attach) { ?>
            <input type="radio" name="<?php echo $pname; ?>_fail_page_text_attach" value="0" />
            <?php echo $text_default; ?>
            <input type="radio" name="<?php echo $pname; ?>_fail_page_text_attach" value="1" checked="checked" />
            <?php echo $text_my; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_fail_page_text_attach" value="0" checked="checked" />
            <?php echo $text_default; ?>
            <input type="radio" name="<?php echo $pname; ?>_fail_page_text_attach" value="1" />
            <?php echo $text_my; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_fail_page_text; ?><br><small><?php echo  $help_var; ?></small></td>
          <td><?php foreach ($languages as $language) { ?>
          <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align:top;"/> <textarea name="<?php echo $pname; ?>_fail_page_text_<?php echo $language['language_id']; ?>" cols="50" rows="3"><?php echo isset(${'mixplatpro_fail_page_text_' . $language['language_id']}) ? ${'mixplatpro_fail_page_text_' . $language['language_id']} : ''; ?></textarea><br /><?php } ?></td>
        </tr>
      </table>
      </div>
      <input type="hidden" name="<?php echo $pname; ?>_methodcode" value="<?php echo $methodcode; ?>" />
      </form>
    </div>
  </div>
</div>
<script>
  var class_row = <?php echo $class_row; ?>;

  var addClassRow = function() {
    html = '<label class="control-label class-row'+ class_row +'"></label>';
    html += '<div class="row class-row'+ class_row +'">';
    html += '<div class="col-sm-3">';
    html += '<select name="<?php echo $pname; ?>_classes['+ class_row +'][<?php echo $pname; ?>_nalog]" class="form-control">';
    html += '<?php foreach ($tax_classes as $tax_class) { ?>';
    html += '<option <?php echo $tax_class["tax_class_id"] == $class[$pname."_nalog"] ? "selected" : ""; ?> value="<?php echo $tax_class["tax_class_id"];?>"><?php echo $tax_class["title"];?></option>';
    html += '<?php } ?>';
    html += '</select>';
    html += '</div>';
    html += '<div class="col-sm-3">';
    html += '<select name="<?php echo $pname; ?>_classes['+ class_row +'][<?php echo $pname; ?>_tax_rule]" class="form-control">';
    html += '<?php foreach ($tax_rules as $tax) { ?>';
    html += '<option <?php echo $tax["id"] == $class[$pname."_tax_rule"] ? "selected" : ""; ?> value="<?php echo $tax["id"];?>"><?php echo $tax["name"];?></option>';
    html += '<?php } ?>';
    html += '</select>';
    html += '</div>';
    html += '<div class="col-sm-1">';
    html += '<button type="button" onclick="$(\'.class-row' + class_row + '\').remove();" class="btn btn-danger button_remove_rule_tax"><i class="fa fa-trash-o"></i></button>';
    html += '</div>';
    $('.rule_tax:last').after(html);

    class_row++;
  }

  $(document).ready(function() {
    $('.required').css('color','red');
    $('.error').css({'color': 'red', 'font-style': 'italic'})

    $('#named_tab').click(function () {
      $('.hidedname').show('fast');
      $('.hidename').hide('fast');
    });
    $('#namep_tab').click(function () {
      $('.hidedname').hide('fast');
      $('.hidename').show('fast');
    });
    $('#pay_tab').click(function () {
      $('#create').prop("checked", true);
      $('.hideotlog').hide('fast');
      $('.showotlog').show('fast');
    });
    $('#stock_tab').click(function () {
      $('#create').prop("checked", true);
      $('.hideotlog').hide('fast');
      $('.showotlog').show('fast');
    });
    $('#standard_tab').click(function () {
      $('.hideotlog').show('fast');
      $('.showotlog').hide('fast');
    });
    $('#fixen0_tab').click(function () {
      $('.hidefixen').hide('fast');
      $('.langfixenP').hide();
      $('.langfixenF').hide();
    });
    $('#fixenP_tab').click(function () {
      $('.hidefixen').show('fast');
      $('.langfixenP').show();
      $('.langfixenF').hide();
    });
    $('#fixenF_tab').click(function () {
      $('.hidefixen').show('fast');
      $('.langfixenP').hide();
      $('.langfixenF').show();
    });
    $('#cartOn_tab').click(function () {
      $('.hide54').show('fast');
    });
    $('#cartOff_tab').click(function () {
      $('.hide54').hide('fast');
    });

    $('#tovar_tab').click(function () {
      $('.hidetovar').show('fast');
      $('.hideimportant').hide('fast');
    });
    $('#important_tab').click(function () {
      $('.hidetovar').hide('fast');
      $('.hideimportant').show('fast');
    });

    $("input[name='<?php echo $pname; ?>_tax_system_code']").change(function() {
        if ($("input[name='<?php echo $pname; ?>_tax_system_code']:checked").val() == 1) {
          $('.nds').show();
          $('.nonds').hide();
        } else {
          $('.nds').hide();
           $('.nonds').show();
        }
    });



  });
</script>
<?php echo $footer; ?> 