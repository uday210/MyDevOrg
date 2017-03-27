global with sharing class AccountRemoter {

    public String accountName { get; set; }
    public static Account account { get; set; }
    public AccountRemoter() { } // empty constructor
    
    @RemoteAction
    global static String getAccount() {
       
        return 'Success';
    }
    
      webservice static String myMethod(String passedid) // you can pass parameters
    { 
         return passedid;
    }
}