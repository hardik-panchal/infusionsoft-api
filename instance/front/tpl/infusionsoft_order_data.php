<?php foreach ($orders as $each_order): ?>
                            <tr>
				<td><input type="checkbox" name="chkorder" id="<?php print $each_order['id'] ?>"/></td>
                                <td><?php print $each_order['infu_Id'] ?></td>
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