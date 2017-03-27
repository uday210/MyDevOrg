({
	doInit : function(cmp, event, helper) {
         var opts = [{class: "optionClass", label: '--None--', value: ''}];
        var CountryRegionObj = {};
       
        var action = cmp.get("c.Allcountries");
        action.setCallback(this, function(response) {
            	             for(var i=0;i<response.getReturnValue().length;i++){
                                 console.log('Cid ',response.getReturnValue()[i]);
                                 opts.push({class: "optionClass", label: response.getReturnValue()[i].Name, value: response.getReturnValue()[i].Id});   
                                 CountryRegionObj[response.getReturnValue()[i].Id] =response.getReturnValue()[i].Region__c; 
                             }
            cmp.find("Countries").set("v.options", opts);
            cmp.set("v.countrydata",CountryRegionObj);	
            console.log('CountryRegionObj ',CountryRegionObj);
        });
        $A.enqueueAction(action);  
        
      
       

	},
    onSelectChange:function(cmp, event, helper){
        var ContactTab	=[];
        var CompanyTab	=[];
        var FocusTab	=[];
        var SegmentTab	=[];
        var ServiceTab  =[];
        
		var selected = cmp.find("Countries").get("v.value");
        var Allvals = cmp.get("v.countrydata");
        if(Allvals[selected] != undefined)
        	cmp.set("v.RegionIs",Allvals[selected]);
        else
            cmp.set("v.RegionIs","");
        console.log('in on change', Allvals[selected]);
       
        cmp.set("v.myPr.Country__c", selected);
       
        //alert(selected);
        var action = cmp.get("c.getFields");
        action.setParams({ SelectedCountryId :selected });
        
        action.setCallback(this, function(response) {
            console.log(response.getReturnValue()[3]);   
           
             for(var i=0;i<response.getReturnValue().length;i++){
                 //alert();
                
             cmp.set("v."+response.getReturnValue()[i].FieldLabel, response.getReturnValue()[i]);
                 if(response.getReturnValue()[i].Tabis=='ContactTab' && response.getReturnValue()[i].isMandatory)
                 {                    
                     ContactTab.push( response.getReturnValue()[i].FieldLabel);
                 }
                 else if(response.getReturnValue()[i].Tabis=='CompanyTab' && response.getReturnValue()[i].isMandatory)
                 {                    
                     CompanyTab.push(response.getReturnValue()[i].FieldLabel);
                 }
                 else if(response.getReturnValue()[i].Tabis=='FocusTab' && response.getReturnValue()[i].isMandatory)
                 {                    
                     FocusTab.push(response.getReturnValue()[i].FieldLabel);
                 }
                 else if(response.getReturnValue()[i].Tabis=='SegmentTab' && response.getReturnValue()[i].isMandatory)
                 {                    
                     SegmentTab.push(response.getReturnValue()[i].FieldLabel);
                 }
                 else if(response.getReturnValue()[i].Tabis=='ServiceTab' && response.getReturnValue()[i].isMandatory)
                 {                    
                     ServiceTab.push(response.getReturnValue()[i].FieldLabel);
                 }
                 
             }
            	cmp.set("v.contacttabReqFields",ContactTab);
           		 console.log('ContactTab ',ContactTab);
                 console.log('CompanyTab ',CompanyTab);
                 console.log('FocusTab ',FocusTab);
                 console.log('SegmentTab ',SegmentTab);
                 console.log('ServiceTab ',ServiceTab);
              
        });      
		  $A.enqueueAction(action);        
    },
    
    goNext:function(cmp,event,hrlper){
        var selected = cmp.find("Countries").get("v.value");
        //alert(selected);
        if(selected=='' || selected==null || selected==undefined){
            cmp.set("v.RequiredFieldsMissing",true);
        }else{
        hrlper.tabMakeActive(cmp,event);
        }
        
    },
    goPrev:function(cmp,event,hrlper){
        
        
  hrlper.tabMakeActivePrev(cmp,event);
        
    },
    doSubmit:function(cmp,event,hrlper){
        console.log('pr is ',cmp.get("v.myPr").Salutation__c);
        console.log('pr is ',cmp.get("v.myPr").First_Name__c);
         cmp.set("v.Partner_sectionTab",false);
        cmp.set("v.ContactTab", false);
        cmp.set("v.CompanyTab", false);
        cmp.set("v.FocusTab", false);
        cmp.set("v.SegmentTab", false);
        cmp.set("v.ServiceTab", false);
        cmp.set("v.CompleteTab",true);
        cmp.set("v.ShowContinueNext",false);
            cmp.set("v.SubmitButton",false);
        
        var CreatedPr = cmp.get("v.myPr");
		console.log('>>> ',CreatedPr);
       // alert(selected);
         var action = cmp.get("c.savePr");
        action.setParams({ userPr :CreatedPr });
         action.setCallback(this, function(response) {
            console.log(response.getReturnValue());    
             cmp.set("v.CreatedPrId",response.getReturnValue());
              
        });      
		  $A.enqueueAction(action); 
   
        
    }
})