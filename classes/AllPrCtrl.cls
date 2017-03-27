public class AllPrCtrl{

     @AuraEnabled
    public static void  updatePr(Partner_request__c  passedPr){


        update passedPr;
    }



     @AuraEnabled
    public static List<Partner_request__c> AllPrs(){


        return [select id,Name,First_Name__c,Last_Name__c,Email__c from Partner_request__c order by Name ASC];
    }
    
    
    @AuraEnabled
    public static Partner_request__c PrData(String Prid){


        return [select id,Address1__c,
                       City__c,Company__c,Country__c,
                       Email__c,First_Name__c,Form_Of_Organization__c,
                       Head_Of_Company__c,Head_Of_Company_Title__c,
                       Job_Category__c,Job_Title__c,Last_Name__c,Mobile__c,
                       Number_of_Years_in_Business__c,Phone__c,PostalCode__c,
                       Salutation__c,State__c,website__c 
                       ,Accoutn_Created__c,Business_Acceptence__c
                       ,Duplicate_Check__c,Completed__c  from Partner_request__c where id=:Prid];
    }

}