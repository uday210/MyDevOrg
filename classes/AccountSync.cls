global class AccountSync
{


    webservice Static String CreateAccountData(String name,String OtherOrgid){
    
    Account a = new Account();
    a.name = name;
    a.OtherAccId__c = OtherOrgid;
    
    insert a;
    
    
    return String.valueOf(a.id);
    }
}