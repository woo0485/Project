/**
 * 
 */
 /* 
$.ajax({
            url: "url",
            method: "GET",
            data : { data : "data" },
            success: function(response) {
                
            console.log("Ajax success:", response);
            
            },
            error: function(xhr, status, error) {
                
                console.error("Ajax error:", status, error);
                
            }
        });
*/
 
 $(function(){
 
 $("#galleryDatePopularity").click(function(event){
 
 event.preventDefault();
 
 $(this).find('span').removeClass('opacity-25');
 $("#galleryDateLatest").find('span').addClass('opacity-25');
 $("#myGallery").find('span').addClass('opacity-25');
 
 $("#galleryContainer").hide();
 $("#galleryContainer3").hide();
 $("#galleryContainer2").show();
 
 });
 
 $("#galleryDateLatest").click(function(event){
 
 event.preventDefault();
 
 $(this).find('span').removeClass('opacity-25');
 $("#galleryDatePopularity").find('span').addClass('opacity-25');
 $("#myGallery").find('span').addClass('opacity-25');
 
 $("#galleryContainer").show();
 $("#galleryContainer2").hide();
 $("#galleryContainer3").hide();
 
 });
 
 $("#myGallery").click(function(){
 
 event.preventDefault();
 
 $(this).find('span').removeClass('opacity-25');
 $("#galleryDatePopularity").find('span').addClass('opacity-25');
 $("#galleryDateLatest").find('span').addClass('opacity-25');
 
 $("#galleryContainer3").show();
 $("#galleryContainer2").hide();
 $("#galleryContainer").hide();
 
 });
 
 $(".galleryDeleteButton").click(function(){
 
  var galleryno = $(this).prev().prev().val();
  var userId = $("#galleryId").val();
 
  if (confirm("삭제하면 복구할 수 없습니다. 정말로 삭제하시겠습니까?")) {
 
				$("[id^=exampleModal]").modal("hide");
				
				$("#userInputPassword").val("");
                $("#passwordModal").modal("show");

                $("#submitPassword").off("click").on("click", function() {
                
                	var userInputPassword = $("#userInputPassword").val();
                    
                    $.ajax({
    					method: "POST",
    					url: "galleryCheckPassword",
    			    	data: { userInputPassword : userInputPassword , userId : userId},
    					success: function(response) {
        					if (response == "true") {
        						$.ajax({
            						url: "galleryDelete",
            						method: "POST",
            						data : { galleryno : galleryno },
            						success: function(response) {
            							alert("삭제되었습니다.");
            							window.location.href = "galleryRedirect";
            						},
            						error: function(xhr, status, error) {
                						console.error("Ajax error:", status, error);
            						}
        						});
        						
            				$("#passwordModal").modal("hide");
            				
       						} else {
           			 			alert("비밀번호가 일치하지 않습니다.");
           			 			$("#userInputPassword").val("");
               					$("#passwordModal").modal("show");
        					 }
    					},
    					error: function() {
       					 		console.log("ajax에러");
    					}
    					
					});
					
				});
   }
 
 });
 
 $(".galleryModifyFormButton").click(function(){
 
  var galleryNo = $(this).prev().val();
  var userId = $("#galleryId").val();
  
  $.ajax({
            url: "galleryModifyFormData",
            method: "GET",
            data : { galleryNo : galleryNo , userId : userId},
            success: function(response) {
            
            var galleryno = response.galleryno;
            var gallerytitle = response.gallerytitle;
            var gallerycontent = response.gallerycontent;
            var gallerywriter = response.gallerywriter;
            
            $("#galleryModifyFormgalleryno").val(galleryno);
            $("#galleryModifyFormgallerytitle").val(gallerytitle);
            $("#galleryModifyFormgallerycontent").val(gallerycontent);
            $("#galleryModifyFormgallerywriter").val(gallerywriter);
            
            $("#galleryModifyForm").submit();
                    
            },
            error: function(xhr, status, error) {
                
                console.error("Ajax error:", status, error);
            }
        });
 
 });
 
$(document).on("click", ".galleryheart", function(event) {
    event.stopPropagation();

    var galleryNo = $(this).attr("data-code");
    var Id = $("#galleryId").val();
    
    if(Id == ""){
    alert("로그인 후 이용가능합니다.");
    return;
    } else {

    $.ajax({
        url: "gallerybad",
        method: "POST",
        data: { galleryno: galleryNo, id: Id },
        dataType: "json",
        success: function(response) {
            console.log("Ajax success:", response);

            $(".gallery-count[data-code='" + galleryNo + "']").text(response);
            $(".galleryheart[data-code='" + galleryNo + "']").html('♡');
            $(".galleryheart[data-code='" + galleryNo + "']").addClass('gallerybad');
            $(".galleryheart[data-code='" + galleryNo + "']").removeClass('galleryheart');
        },
        error: function(xhr, status, error) {
            console.error("Ajax error:", status, error);
        }
    });
    
    }
});

$(".eventtab").click(function(){

$(".eventtab").css("opacity", 0.3);

$(this).css("opacity", 1);

$(".tab-pane").css("display", "none");

var datacode = $(this).attr("data-code");

$("#" + datacode).addClass("show active").css("display", "block");

});

$(document).on("click", ".gallerybad", function(event) {
    event.stopPropagation();

    var galleryNo = $(this).attr("data-code");
    var Id = $("#galleryId").val();
    
    if( Id == "" ){
    alert("로그인 후 이용가능합니다.");
    return;
    } else {

    $.ajax({
        url: "galleryheart",
        method: "POST",
        data: { galleryno: galleryNo, id: Id },
        dataType: "json",
        success: function(response) {
            console.log("Ajax success:", response);

            $(".gallery-count[data-code='" + galleryNo + "']").text(response);
            $(".gallerybad[data-code='" + galleryNo + "']").html('♥︎');
            $(".gallerybad[data-code='" + galleryNo + "']").addClass('galleryheart');
            $(".gallerybad[data-code='" + galleryNo + "']").removeClass('gallerybad');
        },
        error: function(xhr, status, error) {
            console.error("Ajax error:", status, error);
        }
    });
    
    }
});
 
 $("#galleryPage").click(function(event){
 
 			event.preventDefault();
 			
 			$("#galleryidform").submit();
 
 });
 
 $(".areabutton").click(function(){
 
 var areaName = $(this).text();
 var thisName = $(this).attr("id");
 
 $(".areaName").text(areaName)
 
 $("#festivalMapDetail").hide();
 $("#startInfo").show();
 
 $(".mapProductList").hide();
 $('.' + thisName).show();
 
 })
 
 $(".applyButton").click(function(){
 
 var applyId = $("#applyId").val();
 var applyEventNo = $("#applyEventNo").val();
 
 if( applyId == "" ){
 
 alert("로그인 후 이용가능합니다.");
 
 return;
 } else {
 
 alert("응모가 완료되었습니다.");
 
 $("#applyForm").submit();
 }
 
 });
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

 
 });