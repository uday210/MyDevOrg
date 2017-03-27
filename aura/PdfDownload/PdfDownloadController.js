({
	getData : function(component, event, helper) {
		var action = component.get("c.Downloadpdf_file");
        
        action.setCallback(this,function(a){
            
            console.log(a.getReturnValue());
            
            
        });
        
        $A.enqueueAction(action);
	}
})