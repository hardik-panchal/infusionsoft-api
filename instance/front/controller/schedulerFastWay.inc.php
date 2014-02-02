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

_l("FastWay UserID - {$user_id}");

if (!$user_id) {
    _l("Unable to retrieve UserID");
    die;
}

$manifest = $apiFL->getOpenManifest($user_id);
$manifest_id = $manifest['result'][0]['ManifestID'];

_l("Manifest ID: {$manifest_id} ");

if (!$manifest_id) {
    _l("Unable to get menifeft id");
    die;
}


$infusionsoft_order = q("select * from infusionsoft_orders  where pushedFastLabel = '0' LIMIT 0,1 ");

_l('InfusionSoft Orders - ' . count($infusionsoft_order) . " Found ");

if (!empty($infusionsoft_order)) {
    foreach ($infusionsoft_order as $each_order) {
        $data = array();

        _l("Importing Order: {$each_order['id']} | {$each_order['ShipFirstName']} {$each_order['ShipLastName']}");
        qu('infusionsoft_orders', array('pushedFastLabel' => '1'), " id = '{$each_order['id']}' ");
        if ($each_order['invoice_status'] == '0') {
            _l("Invoice is not paid" . $data['error']);
            qu('infusionsoft_orders', array('fastLabel_CostExGst' => 'Invoice is not paid'), " id = '{$each_order['id']}' ");
            continue;
        }

        $data['ManifestID'] = $manifest_id;
        $data['CompanyName'] = $each_order['ShipFirstName'] . " " . $each_order['ShipLastName'];
        if ($each_order['ShipCompany']) {
            $data['CompanyName'] .= " - C/O " . $each_order['ShipCompany'];
        }
        $data['Address1'] = $each_order['ShipStreet1'];
        $data['Address2'] = $each_order['ShipStreet2'];
        $data['Postcode'] = $each_order['ShipZip'];
        $data['Suburb'] = $each_order['ShipCity'];
        $data['ContactPhone'] = $each_order['ShipPhone'];

        $itemsQuery = "select * from infusionsoft_order_items where OrderId = '{$each_order['infu_Id']}' ";
        $items = q($itemsQuery);

        _l('Order Items ' . count($items));
        foreach ($items as $each_item) {
            $data['items'][] = array('Reference' => $each_item['ItemName'], "Weight" => "1", "Quantity" => $each_item['Qty'], "Packaging" => 1);
        }



        _l("Request sent to FastWay:");
        $data = $apiFL->createConsignment($user_id, $data);

        if (isset($data['error']) && $data['error']) {
            _l("Error Thrown By FastWaY" . $data['error']);
            qu('infusionsoft_orders', array('fastLabel_CostExGst' => $data['error']), " id = '{$each_order['id']}' ");
        }

        if (isset($data['result'])) {
            _l("Success: {$data['ManifestID']}");
            $update_array = array();
            $update_array['fastLabel_manifestID'] = $data['result']['ManifestID'];
            $update_array['fastlabel_consignmentID'] = $data['result']['ConsignmentID'];
            $update_array['fastLabel_CostMarkupExGst'] = $data['result']['CostMarkupExGst'];
            $update_array['fastLabel_CostExGst'] = $data['result']['CostExGst'];
            $update_array['fastLabel_LabelColour'] = $data['result']['LabelColour'];
            $update_array['fastLabel_DestinationRFCode'] = $data['result']['DestinationRFCode'];

            d($update_array);

            qu("infusionsoft_orders", $update_array, " id = '{$each_order['id']}' ");

            foreach ($items as $index => $each_item) {
                qu("infusionsoft_order_items", array('fastway_label_no' => $data['result']['LabelNumbers'][$index]), " id = '{$each_item['id']}' ");
            }
        }
    }
} else {
    _l('No Orders Found For Import');
}

$apiFL->closeManifest($manifest_id, $user_id);
_l("Manifest Closed");

_l('Import Complete');

die;
?>