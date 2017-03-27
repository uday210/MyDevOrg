({
	doInit : function(component, event, helper) {
		    var action = component.get("c.getAlldataSets");
				
        		action.setCallback(this, function(response) {
                    
                    var state = response.getState();
				if (state === "SUCCESS") {
		
                    console.log(response.getReturnValue().data);
                    component.set("v.AlldatSet", response.getReturnValue().data);
                    component.set("v.totalDataSet",response.getReturnValue().data.length);
                    
                     var spinner = component.find("mySpinner");
        			$A.util.toggleClass(spinner, "slds-hide");


                }
         		});
        $A.enqueueAction(action);
	},
    
    
    deleteDataset :function(component, event, helper){
    
    console.log(event.target.dataset.id);
	}
})