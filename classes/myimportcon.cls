public class myimportcon {

public blob filedata {get;set;}
public string importedfile {get;set;}

public boolean showoptions {get;set;}

//Api mapping
public string firstcolumnApi{get;set;}
public string secondcolumnApi{get;set;}
public string thirdcolumnApi{get;set;}


public string firstcolumn{get;set;}
public string secondcolumn{get;set;}
public string thirdcolumn{get;set;}

public List<String> csvrows {get;set;}

public list<SelectOption> csvheader {get;set;}
public list<SelectOption> apimapping{get;set;}


public myimportcon (){
showoptions  = false;
apimapping = new list<SelectOption>();

apimapping.add(new SelectOption('name','name'));
apimapping.add(new SelectOption('type','type'));
apimapping.add(new SelectOption('phone','phone'));
}

public list<Account> Accountlist{get;set;}
public void importdata(){

csvheader = new list<SelectOption>();

Accountlist = new list<Account>();
importedfile  = filedata.toString();
csvrows = importedfile.split('\n');

//create a selectoption list 
list<String> headers = new list<String>();

headers  = csvrows[0].split(',');
for(integer k=0;k<headers.size();k++)
csvheader.add(new SelectOption(headers[k],headers [k]));

for( integer i=1;i<csvrows.size();i++)
{
String a = csvrows[i];
Account acc = new Account();
string[] cells = a.split(',');
acc.name=cells[0];
acc.phone=cells[1];

Accountlist.add(acc);
}
if(Accountlist.size()>0)
insert Accountlist;

showoptions = true;

}

public pagereference mapping(){

System.debug('>>>>>>>>>>>>>>>>>>>>>>>>>UDAY<<<<<<<<<<<<<<<<<<<<<<<<<<<');

System.debug('CSV Header ::::::::::::: API Name');
System.debug(firstcolumn+' ::::::::::::: '+firstcolumnApi);
System.debug(secondcolumn+' ::::::::::::: '+secondcolumnApi);
System.debug(thirdcolumn+' ::::::::::::: '+thirdcolumnApi);
return null;
}

}