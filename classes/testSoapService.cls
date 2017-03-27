global class testSoapService{



    webservice static  String MyMethod(){
    
    
    
        return test();
    }
    
    
    public static String test(){
    
    list<Account> acc = [SELECT AccountNumber,AccountSource,Active__c,Actual_Amount__c,AnnualRevenue,BillingAddress,BillingCity,BillingCountry,BillingGeocodeAccuracy,BillingLatitude,BillingLongitude,BillingPostalCode,BillingState,BillingStreet,CleanStatus,ConnectionReceivedId,ConnectionSentId,CreatedById,CreatedDate,CustomerPriority__c,DandbCompanyId,Data_Quality_Description__c,Data_Quality_Score__c,Description,Discount_Applicable_in__c,DunsNumber,Fax,Final_Amount__c,Id,Industry,IsCustomerPortal,IsDeleted,IsPartner,Jigsaw,JigsawCompanyId,LastActivityDate,LastModifiedById,LastModifiedDate,LastReferencedDate,LastViewedDate,logo__c,MasterRecordId,NaicsCode,NaicsDesc,Name,NumberOfEmployees,NumberofLocations__c,OwnerId,Ownership,ParentId,Phone,PhotoUrl,Rating,ShippingAddress,ShippingCity,ShippingCountry,ShippingGeocodeAccuracy,ShippingLatitude,ShippingLongitude,ShippingPostalCode,ShippingState,ShippingStreet,Sic,SicDesc,Site,SLAExpirationDate__c,SLASerialNumber__c,SLA__c,SystemModstamp,tackfield__c,TickerSymbol,Tradestyle,Type,UpsellOpportunity__c,Website,YearStarted FROM Account];
    
    
    return JSON.serialize(acc);
    }
    
    
    
    
    webservice static  List<Account> MyMethod_New(){
    
    
    
        return [select id,name from Account];
    }
    
}