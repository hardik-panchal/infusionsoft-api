<?php

include "initInfusionSoft.php";

$ordersQuery = q("select * from infusionsoft_orders where itemsFetched = '0' ");

if (!empty($ordersQuery)) {
    foreach ($ordersQuery as $each_order) {
        $orderId = $each_order['infu_Id'];
        $qry = array('Id' => $orderId);
        $data = $app->dsQuery("OrderItem", "50", "0", $qry, array('Id', 'OrderId', 'ProductId', 'SubscriptionPlanId', 'ItemName', 'Qty', 'CPU', 'PPU', 'ItemDescription', 'ItemType', 'Notes'));

        if (!empty($data)) {
            foreach ($data as $each_item) {
                $each_item['OrderItem_infu_Id'] = $each_item['Id'];
                unset($each_item['SubscriptionPlanId']);
                unset($each_item['CPU']);
                unset($each_item['PPU']);
                $each_item = array_map("_escape", $each_item);
                qi('infusionsoft_order_items', $each_item, 'replace');
            }
        }
    }
}

die;
?>