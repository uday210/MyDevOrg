({
	getMyAccounts : function(component) {
        var action = component.get("c.getAccounts");//name of the method in apex class
        action.setCallback(this,function(a){
            
            component.set("v.listAccounts",a.getReturnValue());
        });
        $A.enqueueAction(action);//this is required to call that method
		
	}
})