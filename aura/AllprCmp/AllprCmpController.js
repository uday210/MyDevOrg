({
	doInit : function(cmp, event, helper) {
        
        var action = cmp.get("c.AllPrs");
        action.setCallback(this, function(response) {
            	    for(var i=0;i<response.getReturnValue().length;i++){
                                 console.log('Cid ',response.getReturnValue()[i]);
                                
                      }
            
            cmp.set("v.AllPrsLoaded",response.getReturnValue());
                    });
        $A.enqueueAction(action);  
		
	},
    
    popupforEachPr:function(cmp, event, helper){
        
         var selectedItem = event.target;
                       // var Name = selectedItem.dataset.record;
                        console.log('data Name = ',  selectedItem.dataset.id);
        var myEvent = $A.get("e.c:openpopupevent");
      //  myEvent.setParams({"searchkey":event.target.value});
        myEvent.setParams({"pridis": selectedItem.dataset.id});
        
		 myEvent.fire();
    },
    doSearch:function(cmp,event,helper){
        console.log('event',event);
        var EnteredKey = event.getParams();
        alert(EnteredKey.EnteredSerachKey);
        
        
    },
    doInlineEdit:function(cmp){
        
        
        console.log('inline edit');
    }
})