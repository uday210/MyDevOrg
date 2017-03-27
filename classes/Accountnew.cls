public with sharing class Accountnew {

public list<Account> allaccounts {get;set;}

        public Accountnew (){
        allaccounts =new list<Account>();
        
        
        allaccounts =[select name,(select name from contacts) from Account];
        
        }

}