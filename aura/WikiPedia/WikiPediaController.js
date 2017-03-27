({
	searchwiki : function(component, event, helper) {
        console.log('>>>>>>>>>>>>>>');
		//alert('search ');
        if(event.getParam('keyCode') == 13){
            helper.wikiCallout(component.get('v.wikitext'),component, helper);

	}
    }
})