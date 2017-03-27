public class Babitha {
    public list<Account> accs;
    public void Display(){
        accs=[select id,name,(select lastname from Contacts) from Account];
        for(Account a:accs){
            if(a.contacts.size()>0){
                System.debug('Account name is'+a.id);
                System.debug('NO.of Contacts are'+ a.contacts.size());
            }
        }
    }

}