
function TH_ajax(resultSelector, formSelector){
    $.ajax({
        url: "",
        type: "POST",
        data: $(formSelector).serialize(),
        success: function(data){
            $(resultSelector).text(data);
        },
        
        error: function(){
            alert("serialize err");
        }
    });
};

var TH_aajax = function() {
	
	
	
}