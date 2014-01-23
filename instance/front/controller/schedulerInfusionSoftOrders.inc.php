<?php

include "initInfusionSoft.php";


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

die;
?>