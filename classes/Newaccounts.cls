public with sharing class Newaccounts{

    public Account account{get;set;}
    
    public Newaccounts(ApexPages.StandardController controller) {

    }

    public Newaccounts(){
     Account  = new Account();
   }
       
          
                 
     public void Save(){
     
     insert Account;

    }
    
    
     

}