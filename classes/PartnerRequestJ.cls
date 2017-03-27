public class PartnerRequestJ {
     
    Public List <Partner_request__c> partnerrec {get;set;}
    
    
   public PartnerRequestJ(){
        partnerrec = new List <Partner_request__c>();
        
       partnerrec =  [SELECT Accoutn_Created__c,Address1__c,Business_Acceptence__c,City__c,Company__c,Completed__c,ConnectionReceivedId,ConnectionSentId,Country__c,CreatedById,CreatedDate,Duplicate_Check__c FROM Partner_request__c LIMIT 100];
    }
     
 

}