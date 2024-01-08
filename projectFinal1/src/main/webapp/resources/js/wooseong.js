/**
 * 
 */
 
  $(function(){
  
  
	  	$("#cancleTicket").on("click", function() {
		    var bproductno = $(this).next().text();
		    var bticketcount = $(this).next().next().text();
	    	var id = $("#id").val();
	    	
		    if (confirm("예약을 취소하시겠습니까?")) {
		        $("#productno").val(bproductno);
		        $("#reservationticketcount").val(bticketcount);
		        $("#id").val(id);
		        $("#deleteForm").submit();
		    } else {
		       return;
		    }
		});
  
  
  });