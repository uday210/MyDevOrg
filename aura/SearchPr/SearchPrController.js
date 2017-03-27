({
	searchKeyChange : function(component, event, helper) {
        //alert('ínn search comp '+event.target.value);
        
        var myEvent = $A.get("e.c:PrSearchEvent");
      //  myEvent.setParams({"searchkey":event.target.value});
        myEvent.setParams({"EnteredSerachKey": component.find("enteredval").get("v.value")});
        
		 myEvent.fire();
        
	}
})