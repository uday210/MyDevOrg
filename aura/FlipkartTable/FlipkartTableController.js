({
	"getEcomData" : function(component) {
		//alert();
        
        var action = component.get("c.fromFkart");
       console.log(component.get("v.searchdata"));
        action.setParams({
       Query : component.get("v.searchdata")
       
    });

        action.setCallback(this,function(response){
                  var state = response.getState();
           if (state === "SUCCESS") {
               
               var returnValue =response.getReturnValue();
               // alert('The rraja is: ');
               console.log(returnValue.articles);
              
                component.set("v.flipkartData", returnValue );
           }
        });
       $A.enqueueAction(action);
	}
})