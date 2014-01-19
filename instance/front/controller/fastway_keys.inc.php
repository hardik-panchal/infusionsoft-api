<?php

/**
 * File to manage fastway api keys
 * 
 * @author Hardik Panchal<hardikpanchal469@gmail.com>
 * 
 */
if ($_REQUEST['fields']) {
    Config::updateDate($_REQUEST['fields']);
    $greetings = "Values updated successfully";
}
# Get list of infusionsoft keys
$key_value = Config::getData(array('fastway_key'));

_cg("page_title", "FastWay API");
?>
