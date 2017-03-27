({
	doSearch : function(component, event, helper) {
		var EnteredKey = event.getParams();
        alert('from second component '+EnteredKey.EnteredSerachKey);
	}
})