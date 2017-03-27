public class MultiAccSave_ctrl {


public List<Account> AllAccs{get;set;}

    public MultiAccSave_ctrl (){
    
    AllAccs = new list<Account>();
    
    AllAccs.add(new Account());
    
    }
    
public void AddNewRow(){


AllAccs.add(new Account());
}  


public void save_recrds(){

insert AllAccs;

AllAccs = new list<Account>();
AllAccs.add(new Account());

}  
}