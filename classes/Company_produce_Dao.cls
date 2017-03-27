public class Company_produce_Dao{



    public Company_produce_Dao(){
    
    
    
    }



    public list<Company_Product__c> getCompanyData(){
    
    
    
    return [SELECT Description__c,Id,
                   image__c,IsAvailable__c,Name,
                   Price__c,Product_Name__c,
                   Quantity__c,SystemModstamp FROM Company_Product__c];
    
        
        
        }





}