<div class="" id="prerecipient" style="margin-top:10px" >
    <div class="panel panel-default">
        <div class="panel-heading"><b>Fastway API Credentials</b></div>
        <div class="panel-body">
            <form method="post" action="" class="form-horizontal" role="form">
                <?php foreach ($key_value as $index => $each_value): ?>
                    <div class="form-group">
                        <label for="values_<?php print $index ?>" class="col-lg-2 control-label" style="font-weight: normal;"><?php print $each_value['label'] ?></label>
                        <div class=" col-lg-8">
                            <input type="text" class="form-control" name="fields[<?php print $each_value['key'] ?>]" id="values_<?php print $index ?>" value="<?php echo $each_value['value']; ?>" placeholder="" required>
                            <div class="smallHelpText1"><?php print $each_value['help_text'] ?></div>
                        </div>
                    </div>
                <?php endforeach; ?>

                <div class="form-group">
                    <label class="col-lg-2 control-label" >&nbsp;</label>
                    <div class="col-lg-2">
                        <button type="submit" class="btn btn-primary">Update</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<?php include "message.php"; ?>