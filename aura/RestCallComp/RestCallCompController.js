({
	myAction : function(component, event, helper) {
		alert();
	},
    
    buttonpress : function(component,event,helper){
          var email = component.find("email").get("v.value");
    
			var action = component.get("c.getRestdata");
       		action.setParams({
            'email' : email
        	});
 
          action.setCallback(this,function(a){
            
            alert(a.getReturnValue());
        });
        $A.enqueueAction(action);
}
})