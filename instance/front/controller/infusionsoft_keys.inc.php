<?php

/**
 * File to manage infusionsoft api keys
 * 
 * @author Hardik Panchal<hardikpanchal469@gmail.com>
 * 
 */
if ($_REQUEST['fields']) {
    Config::updateDate($_REQUEST['fields']);
    $greetings = "Values updated successfully";
}
# Get list of infusionsoft keys
$key_value = Config::getData(array('infusionsoft_app_name', 'infusionsoft_domain_name', 'infusionsoft_key'));

_cg("page_title", "Infusionsoft API");
?>
