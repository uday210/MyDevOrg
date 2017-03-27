({
	doinit : function(cmp, event, helper) {
         var action = cmp.get("c.processData");
        console.log(cmp.get("v.lrec"));
        var va = "initial";

        action.setParams({start:1,size:100, lasRecordIDinView:cmp.get("v.lrec"),movingIs:"forward"});
        action.setCallback(this, function(response) {
            	console.log(response.getReturnValue());
            console.log('>>>> ',response.getReturnValue().data[response.getReturnValue().data.length-1].Name);
            
            cmp.set("v.FiRec",response.getReturnValue().data[0].Name);
            cmp.set("v.lrec",response.getReturnValue().data[response.getReturnValue().data.length-1].Name);
                    });
        $A.enqueueAction(action);  
        
        
		
	},
    
    doCheck :function(cmp){
        console.log(cmp.find("lrec"));
        
    },
    doNext:function(cmp){
        
         var action = cmp.get("c.processData");
        console.log(cmp.get("v.lrec"));
       

        action.setParams({start:1,size:100, lasRecordIDinView:cmp.get("v.lrec"),movingIs:"forward"});
        action.setCallback(this, function(response) {
            	console.log(response.getReturnValue());
            console.log('>>>> ',response.getReturnValue().data[response.getReturnValue().data.length-1].Name);
                        cmp.set("v.FiRec",response.getReturnValue().data[0].Name);
            cmp.set("v.lrec",response.getReturnValue().data[response.getReturnValue().data.length-1].Name);
                    });
        $A.enqueueAction(action);  
  
    },
    doPrev:function(cmp){
        
         var action = cmp.get("c.processData");
        console.log(cmp.get("v.lrec"));
       

        action.setParams({start:1,size:100, FirstRecIdInView:cmp.get("v.FiRec"),movingIs:"backword"});
        action.setCallback(this, function(response) {
            	console.log(response.getReturnValue());
            console.log('>>>> ',response.getReturnValue().data[response.getReturnValue().data.length-1].Name);
                        cmp.set("v.FiRec",response.getReturnValue().data[0].Name);
            cmp.set("v.lrec",response.getReturnValue().data[response.getReturnValue().data.length-1].Name);
                    });
        $A.enqueueAction(action);  
  
    }
})