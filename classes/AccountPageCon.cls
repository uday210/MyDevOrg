public class AccountPageCon {

public String name {get;set;}

public  PageReference inserAcc(){

Account a = new Account();
a.Name=name;
insert a;

return null;
}

}