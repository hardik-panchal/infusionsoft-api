<?php

$infusionsoft_api_creds = Config::getData(array("infusionsoft_key", "infusionsoft_app_name", "infusionsoft_domain_name"));

$infusionsoft_domain = $infusionsoft_api_creds['1']['value'];
$infusinosoft_key = $infusionsoft_api_creds['2']['value'];
$infusinosoft_app_name = $infusionsoft_api_creds['0']['value'];

require_once(_PATH . "lib/infusionSoft/isdk.php");

$app = new iSDK;

function formatDate($string) {
    return date("Y-m-d H:i:s", strtotime($string));
}

if ($app->cfgCon($infusionsoft_domain, $infusinosoft_key)) {
    $qry = array('Id' => '%');
    $data = $app->dsQuery("Job", "50", "0", $qry, array(
        'Id',
        'JobTitle',
        'ContactId',
        'StartDate',
        'DueDate',
        'JobNotes',
        'ProductId',
        'JobStatus',
        'DateCreated',
        'JobRecurringId',
        'OrderType',
        'OrderStatus',
        'ShipFirstName',
        'ShipMiddleName',
        'ShipLastName',
        'ShipCompany',
        'ShipPhone',
        'ShipStreet1',
        'ShipStreet2',
        'ShipCity',
        'ShipState',
        'ShipZip',
        'ShipCountry',));
    foreach ($data as $key => $each_data) {
        $id = $each_data['Id'];
        $each_data['infu_Id'] = $id;
        unset($each_data['Id']);

        $each_data['StartDate'] = formatDate($each_data['StartDate']);
        $each_data['DueDate'] = formatDate($each_data['DueDate']);
        $each_data['DateCreated'] = formatDate($each_data['DateCreated']);
        $each_data = array_map("_escape", $each_data);
        qi("infusionsoft_orders", $each_data);
    }
} else {
    echo "connection failed";
}
die;
?>