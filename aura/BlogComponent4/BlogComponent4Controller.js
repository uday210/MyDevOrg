({
	setArrayValues : function(component, event, helper) {
//	alert(!component.get("v.sampleArrayAsObject"));
       var action = component.get("c.getAccounts");
        action.setCallback(this,function(a){
          component.set("v.sampleArrayAsObject",a.getReturnValue());
          
            
        });
        $A.enqueueAction(action);
    }        
       // component.set("v.sampleArrayAsObject",["greetings","from","the","controller",new Date().toGMTString()]);
        
})