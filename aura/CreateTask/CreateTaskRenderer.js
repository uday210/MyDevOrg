({
	// Your renderer method overrides go here
	// 
    afterRender :function(cmp){
      //  alert();
        this.superAfterRender();
        var el = cmp.find('addBtn');
        $A.util.removeClass(el.getElement(),'uiButton');
    }
})