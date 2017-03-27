public class saveacc {

public Account acc {get;set;}


public saveacc(){
acc= new Account();

}

public void saveac()
{
System.debug('=====> '+acc);
insert acc;
}
}