<div id="fis_<?php print $each_order['id'] ?>">
    <?php if ($each_order['pushedFastLabel']): ?>
        <?php include "fastway_import_status.php"; ?>
    <?php else: ?>
                <!--    <span class="label label-danger">Scheduled</span>-->
        <span class="label label-success pointer" onclick="doPushToFastLabel('<?php print $each_order['id'] ?>')">Push to FastLabel</span>
    <?php endif; ?>
</div>