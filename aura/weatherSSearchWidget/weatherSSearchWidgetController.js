({
	getdata : function(component, event, helper) {
		var action = component.get("c.getweatherData");
        action.setCallback(this,function(response){
            
            //alert();
            console.log(response.getReturnValue());
            var retJSON = JSON.parse(response.getReturnValue());
            console.log(retJSON);
            
            
        //execute callApexMethod() again after 5 sec each
        window.setInterval(
            $A.getCallback(function() {
              // alert();
            }), 5000);  
	       
        });
        $A.enqueueAction(action);
	}
})