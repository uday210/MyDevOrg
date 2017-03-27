({
	doOpenPopup : function(cmp, event, helper) {
        
         var EnteredKey = event.getParams();
        //alert(EnteredKey.pridis);
       
        var action = cmp.get("c.PrData");
        action.setParams({"Prid":EnteredKey.pridis});
        action.setCallback(this,function(response){
                console.log('Pr data  ',response.getReturnValue());
            	cmp.set("v.selectdPr",response.getReturnValue());
              cmp.set("v.showpopup",true);
            
        });
         $A.enqueueAction(action); 
        
     
		
	},
    
    closePopup:function(cmp, event, helper) {
        
  
       cmp.set("v.showpopup",false);
		
	},
    
    
    	doUpdate : function(cmp, event, helper) {
        
        
       
        var action = cmp.get("c.updatePr");
        action.setParams({"passedPr":cmp.get("v.selectdPr")});
        action.setCallback(this,function(response){
               
              cmp.set("v.showpopup",false);
            
           
        var TableReload = $A.get("e.c:ReloadTable");
     		 TableReload.fire();
        

            
        });
         $A.enqueueAction(action); 
        
     
		
	}
})