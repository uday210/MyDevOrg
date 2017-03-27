public class LightningHelper1 {
@AuraEnabled
    public static List<Account> getAccounts(){
        
        return [Select name,Id, (Select Name, Id From Contacts) from Account order by name limit 10];
    }
}