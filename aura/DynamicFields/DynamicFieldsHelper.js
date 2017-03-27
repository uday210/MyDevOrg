({
	tabMakeActive : function(cmp,event) {
       
        var fieldNameAndids = {};
        var requiredFieldMissing = false;
        cmp.set("v.RequiredFieldsMissing",false);
        fieldNameAndids["Salutationis"] = "salutation_list";
        fieldNameAndids["firstNameis"] = "firstName";
        fieldNameAndids["Lastnameis"] = "LastName";
        fieldNameAndids["jobCategoryis"] = "jobCategory_list";
        fieldNameAndids["stateis"] = "state";
        fieldNameAndids["MobilePhoneis"] = "MobilePhone";
        fieldNameAndids["Emailis"] = "Email";
        
        if(cmp.get("v.Partner_sectionTab")){
            console.log("Partner_sectionTab");
        cmp.set("v.Partner_sectionTab",false);
        cmp.set("v.ContactTab", true);
        cmp.set("v.CompanyTab", false);
        cmp.set("v.FocusTab", false);
        cmp.set("v.SegmentTab", false);
        cmp.set("v.ServiceTab", false);
        cmp.set("v.CompleteTab",false);
        cmp.set("v.SubmitButton",false);
        }
        else if(cmp.get("v.ContactTab")){
            
            var ContactrequiredFieldslist = cmp.get("v.contacttabReqFields");
            console.log("Second");
           
            for(var i=0;i<ContactrequiredFieldslist.length;i++){
               console.log('field values ',cmp.find(fieldNameAndids[ContactrequiredFieldslist[i]]).get("v.value"));
                if(cmp.find(fieldNameAndids[ContactrequiredFieldslist[i]]).get("v.value")=='' || cmp.find(fieldNameAndids[ContactrequiredFieldslist[i]]).get("v.value")==null || cmp.find(fieldNameAndids[ContactrequiredFieldslist[i]]).get("v.value") == undefined){
                   // cmp.find(fieldNameAndids[ContactrequiredFieldslist[i]]).set("v.errors", [{message:"This is a required Field "}]);
                    cmp.set("v.RequiredFieldsMissing",true);
                    requiredFieldMissing  = true;
                }  else{
                    
                   // cmp.find(fieldNameAndids[ContactrequiredFieldslist[i]]).set("v.errors", null);
                }        
            }
            if(!requiredFieldMissing){
        cmp.set("v.Partner_sectionTab",false);
        cmp.set("v.ContactTab", false);
        cmp.set("v.CompanyTab", true);
        cmp.set("v.FocusTab", false);
        cmp.set("v.SegmentTab", false);
        cmp.set("v.ServiceTab", false);
        cmp.set("v.CompleteTab",false);
            cmp.set("v.SubmitButton",false);
                requiredFieldMissing = false;
            }
        }
        else if(cmp.get("v.CompanyTab")){
            console.log("Third");
        cmp.set("v.Partner_sectionTab",false);
        cmp.set("v.ContactTab", false);
        cmp.set("v.CompanyTab", false);
        cmp.set("v.FocusTab", true);
        cmp.set("v.SegmentTab", false);
        cmp.set("v.ServiceTab", false);
        cmp.set("v.CompleteTab",false);
            cmp.set("v.SubmitButton",false);
        }
        else if(cmp.get("v.FocusTab")){
            console.log("Fourth");
        cmp.set("v.Partner_sectionTab",false);
        cmp.set("v.ContactTab", false);
        cmp.set("v.CompanyTab", false);
        cmp.set("v.FocusTab", false);
        cmp.set("v.SegmentTab", true);
        cmp.set("v.ServiceTab", false);
        cmp.set("v.CompleteTab",false);
            cmp.set("v.SubmitButton",false);
        }
        else if(cmp.get("v.SegmentTab")){
            console.log("fifth");
        cmp.set("v.Partner_sectionTab",false);
        cmp.set("v.ContactTab", false);
        cmp.set("v.CompanyTab", false);
        cmp.set("v.FocusTab", false);
        cmp.set("v.SegmentTab", false);
        cmp.set("v.ServiceTab", true);
        cmp.set("v.CompleteTab",false);
            cmp.set("v.SubmitButton",true);
        }
        else if(cmp.get("v.ServiceTab")){
            console.log("sixth");
        cmp.set("v.Partner_sectionTab",false);
        cmp.set("v.ContactTab", false);
        cmp.set("v.CompanyTab", false);
        cmp.set("v.FocusTab", false);
        cmp.set("v.SegmentTab", false);
        cmp.set("v.ServiceTab", false);
        cmp.set("v.CompleteTab",true);
            cmp.set("v.SubmitButton",false);
        }
		
	},
    
    
    tabMakeActivePrev : function(cmp,event) {
        
        if(cmp.get("v.Partner_sectionTab")){
            console.log("Partner_sectionTab");
        cmp.set("v.Partner_sectionTab",false);
        cmp.set("v.ContactTab", true);
        cmp.set("v.CompanyTab", false);
        cmp.set("v.FocusTab", false);
        cmp.set("v.SegmentTab", false);
        cmp.set("v.ServiceTab", false);
        cmp.set("v.CompleteTab",false);
            cmp.set("v.SubmitButton",false);
        }
        else if(cmp.get("v.ContactTab")){
            console.log("Second");
        cmp.set("v.Partner_sectionTab",true);
        cmp.set("v.ContactTab", false);
        cmp.set("v.CompanyTab", false);
        cmp.set("v.FocusTab", false);
        cmp.set("v.SegmentTab", false);
        cmp.set("v.ServiceTab", false);
        cmp.set("v.CompleteTab",false);
            cmp.set("v.SubmitButton",false);
        }
        else if(cmp.get("v.CompanyTab")){
            console.log("Third");
        cmp.set("v.Partner_sectionTab",false);
        cmp.set("v.ContactTab", true);
        cmp.set("v.CompanyTab", false);
        cmp.set("v.FocusTab", false);
        cmp.set("v.SegmentTab", false);
        cmp.set("v.ServiceTab", false);
        cmp.set("v.CompleteTab",false);
            cmp.set("v.SubmitButton",false);
        }
        else if(cmp.get("v.FocusTab")){
            console.log("Fourth");
        cmp.set("v.Partner_sectionTab",false);
        cmp.set("v.ContactTab", false);
        cmp.set("v.CompanyTab", true);
        cmp.set("v.FocusTab", false);
        cmp.set("v.SegmentTab", false);
        cmp.set("v.ServiceTab", false);
        cmp.set("v.CompleteTab",false);
            cmp.set("v.SubmitButton",false);
        }
        else if(cmp.get("v.SegmentTab")){
            console.log("fifth");
        cmp.set("v.Partner_sectionTab",false);
        cmp.set("v.ContactTab", false);
        cmp.set("v.CompanyTab", false);
        cmp.set("v.FocusTab", true);
        cmp.set("v.SegmentTab", false);
        cmp.set("v.ServiceTab", false);
        cmp.set("v.CompleteTab",false);
            cmp.set("v.SubmitButton",false);
        }
        else if(cmp.get("v.ServiceTab")){
            console.log("sixth");
        cmp.set("v.Partner_sectionTab",false);
        cmp.set("v.ContactTab", false);
        cmp.set("v.CompanyTab", false);
        cmp.set("v.FocusTab", false);
        cmp.set("v.SegmentTab", true);
        cmp.set("v.ServiceTab", false);
        cmp.set("v.CompleteTab",false);
            cmp.set("v.SubmitButton",false);
        }
		
	}
})