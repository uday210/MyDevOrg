public class DeleteUnacceptedQuotes { 
    @InvocableMethod
    public static void QuotesDelete(list<id> oppids){
        System.debug('>>>>>>>>>>>>>>>>> '+oppids);
        List<Order> Orders =[select id from Order where Opportunity.id in :oppids and status__c != 'Accepted'];      
        delete Orders;
        
    }
}