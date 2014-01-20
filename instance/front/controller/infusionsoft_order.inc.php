<?php

_errors_on();
$infusionsoft_api_creds = Config::getData(array("infusionsoft_key", "infusionsoft_app_name", "infusionsoft_domain_name"));

$infusionsoft_domain = $infusionsoft_api_creds['1']['value'];
$infusinosoft_key = $infusionsoft_api_creds['2']['value'];
$infusinosoft_app_name = $infusionsoft_api_creds['0']['value'];

require_once(_PATH . "lib/infusionSoft/isdk.php");

$app = new iSDK;

if ($app->cfgCon($infusionsoft_domain, $infusinosoft_key)) {

    echo "connected<br/>";
    echo "app connected<br/>";

    $data = $app->dsQueryOrderBy();
    d($data);
} else {
    echo "connection failed";
}
die;

/**
 * Infusionsoft order integration page
 */
_cg("page_title", "Infusionsoft Orders");
?>
