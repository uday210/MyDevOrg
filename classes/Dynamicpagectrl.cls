public with sharing class Dynamicpagectrl{
    private Account acc;
    public Account getAcc() { return acc; }


    public Dynamicpagectrl(ApexPages.StandardController stdController) {
        if (String.isEmpty(ApexPages.currentPage().getParameters().get('id'))) {
            this.acc= new Account();
        } else {
            this.acc= 
                [SELECT 
                    Id,
                    Name,tackfield__c,PhotoUrl,For_Tracking__c
                   
                FROM Account
                WHERE Id = :ApexPages.currentPage().getParameters().get('id')];
        }
    }

    public PageReference save() {
        ApexPages.StandardController sc = new ApexPages.StandardController(acc);
        return sc.save();
    }

    public PageReference cancel() {
        ApexPages.StandardController sc = new ApexPages.StandardController(acc);
        return sc.cancel();
    }   
}