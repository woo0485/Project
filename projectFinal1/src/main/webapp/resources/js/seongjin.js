/**
 * 
 */
 
 $(function(){
 
 $("#galleryDatePopularity").click(function(){
 
 $.ajax({
            url: "galleryDatePopularity",
            method: "GET",
            dataType: "json",
            success: function(response) {
                
                console.log("Ajax success:", response);
            },
            error: function(xhr, status, error) {
                
                console.error("Ajax error:", status, error);
            }
        });
 
 });
 
 });