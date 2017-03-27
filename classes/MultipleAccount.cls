public class MultipleAccount {
    public List<Account> accList {get;set;}
    public MultipleAccount(){
        accList=new List<account>();
        Account acc=new Account();
        accList.add(acc);
    }
    public void save(){
        insert accList;
    }
    public void cancel(){
        
    }
    public void addacc(){
        Account acc=new Account();
        accList.add(acc);
    }
    public void delet(){
        
    }

}