<?php if ($each_order['pushedFastLabel']): ?>
    <?php if (is_numeric($each_order['fastLabel_CostExGst'])): ?>
        <span class="label label-success">Yes</span>
        <div class="clearfix" style="height:2px">&nbsp;</div>
        <div class="">
            <table class="table table-bordered table-hover table-condensed">
                <tr>
                    <td width="150">Manifest ID</td>
                    <td><?php print $each_order['fastLabel_manifestID'] ?></td>
                </tr>
                <tr>
                    <td>Consignment ID</td>
                    <td><?php print $each_order['fastlabel_consignmentID'] ?></td>
                </tr>
                <tr>
                    <td>Cost</td>
                    <td><?php print $each_order['fastLabel_CostExGst'] ?></td>
                </tr>
                <tr>
                    <td>Label Color</td>
                    <td><?php print $each_order['fastLabel_LabelColour'] ?></td>
                </tr>
                <tr>
                    <td>Destination</td>
                    <td><?php print $each_order['fastLabel_DestinationRFCode'] ?></td>
                </tr>
            </table>

        </div>
    <?php else: ?>
        <span class="label label-warning"><?php print $each_order['fastLabel_CostExGst'] ?></span>
    <?php endif; ?>
<?php else: ?>
    <span class="label label-danger">Scheduled</span>
<?php endif; ?>
