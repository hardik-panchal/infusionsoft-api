<?php

/**
 * Controller file for infusionsoft order page
 * 
 * @author Hardik Panchal<hardikpanchal469@gmail.com>
 * @since January 24, 2014
 * 
 */
$orders = q("select * from infusionsoft_orders order by id desc  ");
_cg("page_title", "Infusionsoft Orders");
?>
