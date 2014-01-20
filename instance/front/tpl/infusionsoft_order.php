<div class="" id="prerecipient" style="margin-top:10px" >
    <div class="panel panel-default">
        <div class="panel-heading"><b>Infusionsoft API</b></div>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table  " >
                    <thead>
                        <tr>
                            <th>Order Id</th>
                            <th >Last name</th>
                            <th width="145" >Order date</th>
                            <th width="145">OrderType</th>
                            <th width="145">Shipping Address</th>
                            <th width="280">Pushed to FastWay</th>
                        </tr>
                    </thead>
                    <tbody >
                        <?php foreach ($orders as $each_order): ?>
                            <tr>
                                <td><?php print $each_order['infu_Id'] ?></td>
                                <td><?php print $each_order['ShipFirstName'] . " " . $each_order['ShipLastName'] ?></td>
                                <td><?php print date("d/m/Y",strtotime($each_order['DateCreated'])) ?></td>
                                <td><?php print $each_order['OrderType'] ?></td>
                                <td width="300"><?php print implode(", ",array_filter(array($each_order['ShipStreet1'],$each_order['ShipStreet2'],$each_order['ShipCity'],$each_order['ShipZip'],$each_order['ShipState'],$each_order['ShipCountry']))) ?></td>
                                <td><span class="label label-danger">No</span></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<?php include "message.php"; ?>