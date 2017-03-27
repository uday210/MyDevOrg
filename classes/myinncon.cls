public class myinncon {
public list<innclass> aas {get;set;}
public list<Account> acounts;
public list<contact>  con {get;set;}
public String del {get;set;}
public myinncon (){
con =new list<contact>();
con.add(new contact());
aas = new list<innclass> (); 
}
public void displayform()
{
Integer i =0;
for(account ac :[select id,name,AccountNumber from Account ])
{
aas.add(new innclass(ac.name,ac.AccountNumber ,ac.id));
i++;
}
if(i == 0)
aas.add(new innclass());

}
public void addrow(){
aas.add(new innclass());
}
public void addccrow()
{
con.add(new contact());

}
public void saverec()
{
list<Account> Allacc = new list<Account>();
for(innclass inn:aas)
{
Account a = new Account();
a.name = inn.name;
a.AccountNumber = inn.aanumber;
a.id=inn.id;
Allacc.add(a);
}
upsert Allacc;
}




public void deleterec()
{

//String i = ApexPages.currentPage().getParameters().get('deleteid');
Integer ii = Integer.valueOf(del);
System.debug('.............. '+del);
innclass aa= aas[ii];
if(aa.id != null && aa.id != ''){
Account ac = [select id,name from Account where id =: aa.id];
delete ac;
}
aas.remove(ii);


}

public class innclass{

public string name{get;set;}
public string  aanumber{get;set;}
public string  id{get;set;}
public innclass(){

}
public innclass(String name,String aanumber,String id){
this.name = name;
this.aanumber = aanumber;
this.id = id;
}
}
}