<?php

/**
 * File to import infusionsoft orders
 * 
 * @author Hardik Panchal<hardikpanchal469@gmail.com>
 * @since January 20, 2014
 * 
 * 
 * invoiceid, status, amount
 * 
 */
include "initInfusionSoft.php";
_l("Importing Orders");
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

_l(" Found " . count($data) . " Orders ");

foreach ($data as $key => $each_data) {

    $id = $each_data['Id'];
    _l("Importing Job: {$id}");
    $each_data['infu_Id'] = $id;
    unset($each_data['Id']);

    $each_data['StartDate'] = formatDate($each_data['StartDate']);
    $each_data['DueDate'] = formatDate($each_data['DueDate']);
    $each_data['DateCreated'] = formatDate($each_data['DateCreated']);

    # check invoice status
    $qry = array('JobId' => $id);
    $invoice_data = $app->dsQuery('Invoice', '1', '0', $qry, array('PayStatus', 'InvoiceTotal', 'DateCreated', 'JobId', 'Id'));

    if (!empty($invoice_data)) {
        $each_data['invoice_id'] = $invoice_data[0]['Id'];
        $each_data['invoice_status'] = $invoice_data[0]['PayStatus'];
        $each_data['invoice_amount'] = $invoice_data[0]['InvoiceTotal'];
        _l("Getting Invoice Status: " . $each_data['invoice_status'] . " - " . $each_data['invoice_amount']);
    }

    $each_data = array_map("_escape", $each_data);
    qi("infusionsoft_orders", $each_data);
}
_l("Import done");
die;
?>