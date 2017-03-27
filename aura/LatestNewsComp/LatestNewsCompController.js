({
	getlatestnews : function(component, event, helper) {
		
    var action = component.get("c.getNews");
        action.setCallback(this,function(response){
            
            console.log( response.getReturnValue());
               var returnValue =response.getReturnValue();
           
            component.set("v.news", returnValue.articles);
        });
        
        $A.enqueueAction(action);
    }
})