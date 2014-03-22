<script type="text/javascript">
    
   
    function getNextrecord(){
        $("#prebtn").show();
        var page_no = $("#next_page_no").html();
        $("#next_page_no").html(parseInt(page_no) + parseInt(10));
        page_no = $("#next_page_no").html();
	if(page_no > $("#countdata").html())
	{
	    $("#nextbtn").hide();
	}
        showWait();
        $.ajax({
            url:_U+'infusionsoft_order',
            data:{Nextrecord:1,Limit:page_no},
            success:function(r){
                hideWait();
                $("#orderList").html(r);
                //$("#next_page_no").html(parseInt(page_no) + parseInt(10));
            }
        });
    }
    function getPrerecord(){
	$("#nextbtn").show();
        var page_no = $("#next_page_no").html();
        $("#next_page_no").html(parseInt(page_no) - parseInt(10));
        page_no = $("#next_page_no").html();
        if(page_no == 0){
            $("#prebtn").hide();
        }
        showWait();
        $.ajax({
            url:_U+'infusionsoft_order',
            data:{Nextrecord:1,Limit:page_no},
            success:function(r){
                hideWait();
                $("#orderList").html(r);
                //$("#next_page_no").html(parseInt(page_no) - parseInt(10));
            }
        });
    }
    function selectAll(status)
    {
        if(status == true){
	    $(':input:checkbox[name="chkorder"]').prop('checked', true);
	}else{
	    $(':input:checkbox[name="chkorder"]').prop('checked', false);
	}
    }
    function doPushToFastAllLabel()
    {
	//var checkboxes = $("input[type=checkbox]:checked");
	var checkboxes = $(':input:checkbox[name="chkorder"]:checked');

	$.each(checkboxes,function(index,element){
	    console.log(element.id);
	    doPushToFastLabel(element.id);
	});
    }
    
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