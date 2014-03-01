<?php

/**
 * Controller file for infusionsoft order page
 * 
 * @author Hardik Panchal<hardikpanchal469@gmail.com>
 * @since January 24, 2014
 * 
 */
if ($_REQUEST['fastwayStatus']) {
    $id = _escape($_REQUEST['fastwayStatus']);
    $each_order = qs("select * from infusionsoft_orders where id='{$id}' limit 0,1 ");
    include _PATH . "instance/front/tpl/fastway_import_status.php";
    die;
}
$orders = q("select * from infusionsoft_orders order by id desc limit 0,100  ");
$jsInclude = "infusionsoft_order.js.php";
_cg("page_title", "Infusionsoft Orders");
?>
