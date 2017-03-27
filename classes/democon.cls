public with sharing class democon {

    public PageReference updaterec() {
        
        update acc;
        return null;
    }


public Account acc {get;set;}


public democon (){

acc = new Account();

acc = [select id,name from Account limit 1];
}



}