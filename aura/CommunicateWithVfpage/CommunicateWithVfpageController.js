({
	sendToVF : function(component, event, helper) {
        
        var msg = component.find("msg").get("v.value");
        alert(msg);
        var vfOrigin = "https://"+component.get("v.vfDomain");
        var vfWindow = component.find("vfFrame").getElement().contentWindow;
		vfWindow.postMessage(msg, vfOrigin);
		
	}
})