({
	Calculate : function(component, event, helper) {
		var a = component.find("n1").get("v.value");
        var b = component.find("n2").get("v.value");
        
        var c = parseInt(a) + parseInt(b);
        c = c+'';
        
        var evt = $A.get("e.c:myfirstevent");
        evt.setParams({"passedString":c});
        evt.fire();
	}
})