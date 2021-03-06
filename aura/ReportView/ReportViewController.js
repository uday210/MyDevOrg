({
	doInit : function(component) {
		var action = component.get("c.runReport");
        action.setCallback(this,function(a){
            var reportData = JSON.parse(a.getReturnValue());
            var returnData=[];
            
            for(var i=0,j=reportData.groupingsDown.groupings.length;i<j;i++){
                
                var label =reportData.groupingsDown.groupings[i].label;
                var key =reportData.groupingsDown.groupings[i].key;
                var value = reportData.factMap[key + '!T'].aggregates[0].value;
                returnData.push([label,value]);
            }
            
            var chart = c3.generate({
                
                bindto:'#chart',
                data:{
                    columns:returnData,
                    type:'donut'
                }
            });
        
        });
        $A.enqueueAction(action);
	}
})