/**
 * 
 */
 /* 
$.ajax({
            url: "galleryOrderType",
            method: "GET",
            data : { orderType : "galleryDatePopularity" },
            success: function(response) {
                
            console.log("Ajax success:", response);
            
            

            
            },
            error: function(xhr, status, error) {
                
                console.error("Ajax error:", status, error);
            }
        });
*/
 
 $(function(){
 
 $("#galleryDatePopularity").click(function(){
 
 event.preventDefault();
 
 $(this).find('span').removeClass('opacity-25');
 $("#galleryDateLatest").find('span').addClass('opacity-25');
 
 $("#galleryContainer").hide();
 $("#galleryContainer2").show();
 
 });
 
 $("#galleryDateLatest").click(function(){
 
 event.preventDefault();
 
 $(this).find('span').removeClass('opacity-25');
 $("#galleryDatePopularity").find('span').addClass('opacity-25');
 
 $("#galleryContainer").show();
 $("#galleryContainer2").hide();
 
 });
 
 $(".galleryheart").click(function(event){
 
 event.stopPropagation();
 
 var galleryNo = $(this).attr("data-code");
 
 $.ajax({
            url: "galleryheart",
            method: "POST",
            data : { galleryno : galleryNo },
            dataType: "json",
            success: function(response) {
                
            console.log("Ajax success:", response);
            
            $(".gallery-count[data-code='" + galleryNo + "']").text(response);
            
            },
            error: function(xhr, status, error) {
                
            console.error("Ajax error:", status, error);
            }
        });
 
 });

 
 });