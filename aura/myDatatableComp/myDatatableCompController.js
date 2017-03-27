({
    getInput : function(cmp, evt,helper) {
        var myName = cmp.find("name").get("v.value");
       var data = [];
        if(myName != undefined && myName != null && myName != '')
        {
    helper.getData(cmp,10,myName);
        }else{
            
cmp.set("v.wrapperClass", data);            
        }

    },
    onSelectChange: function(component, event, helper) {
      // this function call on the select opetion change,	 
       var recordToDisply = component.find("recordSize").get("v.value");
          var myName = component.find("name").get("v.value");
       var data = [];
         if(myName != undefined && myName != null && myName != '')
        {
         helper.getData(component,recordToDisply,myName);
        }else{
           cmp.set("v.wrapperClass", data); 
            
        }
     // helper.getAccounts(component, page, recordToDisply);
   }
})