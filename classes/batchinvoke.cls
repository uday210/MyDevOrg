public class batchinvoke {
public String toaddress{get;set;}
public String Subject{get;set;}
public string HtmlBody{get;set;}
public boolean rendered{get;set;}
Public String Statusmsg{get;set;}

public batchinvoke(){
rendered  = true;
}
public void invoke(){
CustomerProessingBatch cp = new CustomerProessingBatch (toaddress,Subject,HtmlBody);
Database.executeBatch(cp,1000);
Statusmsg = 'Batch Export Started Please chek email......';
rendered = false;
}
}