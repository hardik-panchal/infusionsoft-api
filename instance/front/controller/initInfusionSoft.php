<?php

$infusionsoft_api_creds = Config::getData(array("infusionsoft_key", "infusionsoft_app_name", "infusionsoft_domain_name"));

$infusionsoft_domain = $infusionsoft_api_creds['1']['value'];
$infusinosoft_key = $infusionsoft_api_creds['2']['value'];
$infusinosoft_app_name = $infusionsoft_api_creds['0']['value'];

require_once(_PATH . "lib/infusionSoft/isdk.php");

$app = new iSDK;
if (!$app->cfgCon($infusionsoft_domain, $infusinosoft_key)) {
    die("UNABLE_TO_CONNECT_INFUSION_SOFT_API");
}
?>