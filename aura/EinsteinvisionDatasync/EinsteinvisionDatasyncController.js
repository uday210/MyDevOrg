({
	docallout : function(component, event, helper) {
		
        var urlPath = component.find("dataPath").get("v.value");
        console.log(urlPath);
        
        var action = component.get("c.EinsteinvisionDataSync");
        	action.setParams({ ZipfilePath : urlPath });
        
         		action.setCallback(this, function(response) {
         	});
        $A.enqueueAction(action);

	}
})