({
	count : function(component, event, helper) {
       
        var cc = component.get("v.Counter");
        cc=cc+1;
		component.set("v.Counter",cc);
	}
})