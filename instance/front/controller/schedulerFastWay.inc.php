<?php

/**
 *  Scheduler file for fastway to push the 
 *  infusionsoft order into fastway > fastlabel
 * 
 *  @author Hardik Panchal<hardikpanchal469@gmail.com>
 *  @since January 24, 2014
 * 
 */
_errors_on();

$apiFL = new apiFastLabel();

# Get the userid from fastlabel
$users = $apiFL->getUsers();
$user_id = $users['result'][0]['UserID'];

if (!$user_id) {
    die("Unable to retrieve UserID");
}

$manifest = $apiFL->getOpenManifest($user_id);
$manifest_id = $manifest['result'][0]['ManifestID'];

if (!$manifest_id) {
    die("Unable to get menifeft id");
}


$infusionsoft_order = q("select * from infusionsoft_orders  where pushedFastLabel = '0' LIMIT 0,1 ");

_l('Retrieved InfusionSoft Orders - ' . count($infusionsoft_order) . " Found ");
die;
if (!empty($infusionsoft_order)) {
    foreach ($infusionsoft_order as $each_order) {
        $data = array();

        $data['ManifestID'] = $manifest_id;
        $data['CompanyName'] = $each_order['ShipFirstName'] . " " . $each_order['ShipLastName'];
        if ($each_order['ShipCompany']) {
            $data['CompanyName'] .= "C/O " . $each_order['ShipCompany'];
        }
        $data['Address1'] = $each_order['ShipStreet1'];
        $data['Address2'] = $each_order['ShipStreet2'];
        $data['Postcode'] = $each_order['ShipZip'];
        $data['Suburb'] = $each_order['ShipCity'];
        $data['ContactPhone'] = $each_order['ShipPhone'];
        $data['items'] = array("0" => array('Reference' => '1', "Weight" => "1", "Quantity" => "1", "Packaging" => 1));
        qu('infusionsoft_orders', array('pushedFastLabel' => '1'), " id = '{$each_order['id']}' ");
        $data = $apiFL->createConsignment($user_id, $data);
        d($data);
    }
} else {
    _l('No Orders Found For Import');
}


_l('Import Complete');

die;
?>