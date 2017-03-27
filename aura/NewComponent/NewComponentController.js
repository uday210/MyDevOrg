({
	testAction : function(component, event, helper) {
	alert('hello world...');	
	},
    likeIt:function(component, event, helper){
    alert('like clicked');
},
    unlikeIt:function(component, event, helper){
    alert('unlike clicked');
},
    handleblur:function(cmp,event,helper){
        
        var elem = cmp.find("mytextArea").get("v.value");
        console.log(elem);
    },
    newblur:function()
    {
        
        alert('newblur');
    },
    getInput:function(cmp,event){
        
        var aa = cmp.find('tbox').get("v.value");
        alert(aa);
        var bb= cmp.find('newval');
        bb.set("v.value",aa);
    }
})