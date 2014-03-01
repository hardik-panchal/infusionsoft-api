<script type="text/javascript">
    function doPushToFastLabel(id) {
        _handler = function() {
            $("#fis_" + id).html('Please wait..');
            showWait();
            $.ajax({
                type: "POST",
                url: "<?php print _U ?>infusionsoft_order",
                data: {fastwayStatus: id}
            }).done(function(msg) {
                hideWait();
                $("#fis_" + id).html(msg);
            });
        }
        showPopup('<span>Pushing orders to FastWay...</span><iframe style="border:1px solid #DADADA" src="<?php print _U ?>schedulerFastWay?infusion_order_id=' + id + '" height=350 width="100%"></iframe>', 'Pushing Orders To FastWay');
    }

</script>