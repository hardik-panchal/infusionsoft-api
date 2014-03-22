<div class="" id="prerecipient" style="margin-top:10px" >
    <div class="panel panel-default">
        <div class="panel-heading"><b>Infusionsoft API&nbsp;&nbsp;</b>
	<span id="next_page_no" class="hide">0</span>
            <span id="countdata" class="hide"><?php print $length; ?></span>

            <span id="prebtn" style="display:none" class="btn btn-default" onclick="getPrerecord();"><i class="fa fa-chevron-left"></i></span>
	    <span id="nextbtn" class="btn btn-default" onclick="getNextrecord();"><i class="fa fa-chevron-right"></i></span>&nbsp;
	    <div style="float:right">
		
		<button type="button" onclick="doPushToFastAllLabel()" class="btn btn-success">Push to FastLabel</button>
	    </div>
	</div>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table  " >
                    <thead>
                        <tr>
			    <th width="50"><input type="checkbox" name="chkmain" id="chkmail" onclick="selectAll(this.checked);"/></th>
                            <th width="100">Order Id</th>
                            <th width="300" >Invoice</th>
                            <th width="300" >Customer name</th>
                            <th>Items</th>
                            <th width="280">Pushed to FastWay</th>
                        </tr>
                    </thead>
                    <tbody id="orderList">
                        <?php foreach ($orders as $each_order): ?>
                            <tr>
				<td><input type="checkbox" name="chkorder" id="<?php print $each_order['id'] ?>"/></td>
                                <td><?php print $each_order['id'] ?></td>
                                <td>
                                    <b><?php print $each_order['ShipFirstName'] . " " . $each_order['ShipLastName'] ?></b>
                                    <br />
                                    <?php print implode(", ", array_filter(array($each_order['ShipStreet1'], $each_order['ShipStreet2'], $each_order['ShipCity'], $each_order['ShipZip'], $each_order['ShipState'], $each_order['ShipCountry']))) ?>
                                </td>
                                <td><?php include "infusionsoft_order_list_tems.php"; ?></td>
                                <td>
                                    <b>NZD <?php print number_format($each_order['invoice_amount'], 2); ?> </b><br />
                                    <?php print $each_order['invoice_status'] ? "Paid" : "Unpaid"  ?> <br />
                                    <?php print date("d/m/Y", strtotime($each_order['DateCreated'])) ?>
                                </td>

                                <td align="left">
                                    <?php include "infusionsoft_order_fastway_status.php"; ?>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<?php include "message.php"; ?>
<?php include 'genericPopup.php'; ?>