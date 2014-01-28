<?php
$itemQuery = "select * from  infusionsoft_order_items where OrderId = '{$each_order['infu_Id']}' ";
$items = q($itemQuery);
?>
<div>
    <?php if (empty($items)): ?>
        <span class="label label-danger">No Items</span>
    <?php else: ?>
        <?php foreach ($items as $each_item): ?>
            <span class="label label-success" data-toggle="tooltip" title="<?php print $each_item['ItemDescription'] ?>"><?php print $each_item['ItemName'] ?></span>
            <span class="label label-warning">Qty - <?php print $each_item['Qty'] ?></span>
            <?php if ($each_item['fastway_label_no']): ?>
                <span class="label label-info">FastLabel - <?php print $each_item['fastway_label_no'] ?></span>
            <?php endif; ?>

            <div class="clearfix" style="height:2px">&nbsp;</div>
        <?php endforeach; ?>
    <?php endif; ?>
</div>