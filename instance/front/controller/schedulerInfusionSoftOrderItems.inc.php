<?php

include "initInfusionSoft.php";

_errors_on();
set_time_limit(0);

$ordersQuery = q("select * from infusionsoft_orders where itemsFetched = '0' order by id desc LIMIT 0,500");
$count = count($ordersQuery);

_l("found {$count} orders to retrieve items");


if (!empty($ordersQuery)) {
    foreach ($ordersQuery as $each_order) {
        $orderId = $each_order['infu_Id'];
        qu('infusionsoft_orders', array('itemsFetched' => '1'), " infu_Id = '{$orderId}' ");
        $qry = array('OrderId' => $orderId);
        $data = $app->dsQuery("OrderItem", "50", "0", $qry, array('Id', 'OrderId', 'ProductId', 'SubscriptionPlanId', 'ItemName', 'Qty', 'CPU', 'PPU', 'ItemDescription', 'ItemType', 'Notes'));

        if (!empty($data)) {
            $count = count($data);
            _l("Found {$count} items for order # {$orderId}");
            foreach ($data as $each_item) {
                if ($each_item['ProductId'] == 0) {
                    continue;
                }
                $each_item['OrderItem_infu_Id'] = $each_item['Id'];
                unset($each_item['SubscriptionPlanId']);
                unset($each_item['CPU']);
                unset($each_item['PPU']);
                $each_item = array_map("_escape", $each_item);
                qi('infusionsoft_order_items', $each_item, 'replace');
            }
        } else {
            _l("No Items for order # {$orderId} ");
        }
    }
} else {
    _l('No Order to retrieve items');
}

die;
?>