({
	save : function(component, event, helper) {
		//alert('saved');
		var subject =     component.find("subject").get("v.value");
        var priority =    component.find("priority").get("v.value");
        var type =        component.find("type").get("v.value");
        var description = component.find("description").get("v.value");
        
       var action1 = component.get("c.taskcreate");
        
        action1.setParams({
            "subject":subject,
            "priority":priority,
            "type":type,
            "description":description
            
        });
        action1.setCallback(this,function(action1){
            
            component.find("subject").set("v.value","");
            component.find("priority").set("v.value","High");
            component.find("type").set("v.value","Call");
            component.find("description").set("v.value","");
        });
        $A.enqueueAction(action1);
	}
})