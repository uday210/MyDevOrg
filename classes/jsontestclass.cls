global with Sharing class jsontestclass{



String mydata = '[{"price":80.0,"product_id":"pd-0008","qty":4,"somelidt":[{"name":["uday","kiran"],"Age":25,"phone":[{"home":"1234567999","work":"123132"},{"home":"1234567999","work":"123132"},{"home":"1234567999","work":"123132"},{"home":"1234567999","work":"123132"}]}]},{"price":40.0,"product_id":"pd-0001","qty":3,"somelidt":[{"name":["surya","Shravan"],"Age":23,"phone":[{"home":"1234567999","work":"123132"}]}]}]';

public list<Jsonparsercls> alldatais{get;set;} 
public map<String,Products__c > idProduct;

global jsontestclass(){
alldatais = new list<Jsonparsercls>();

}
  

  global void doPost(){
  
  
idProduct = new map<String,Products__c >();
  for(Products__c  p : [select id,name ,Availability__c,Quantity__c from Products__c ]){
  idProduct.put(p.name,p);
  
  }

//eg. String body = '{"name" : "Michael", "company" : "Sonoma Partners"}';
List<Transaction__c> AllTrans= new list<Transaction__c>();
JSONParser parser = JSON.createParser(mydata );
     while (parser.nextToken() != null) {
         if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
               Jsonparsercls le = (Jsonparsercls)parser.readValueAs(Jsonparsercls.class);
              System.debug('>>>>>>>>>> '+le);  
              alldatais.add(le);
            }
                        
      }
 
System.debug('AllTrans  '+AllTrans);

  }
  
  
global Transaction__c callmethod(Jsonparsercls passedobj){

Products__c  p = idProduct.get(passedobj.product_id);

System.debug('Passed product '+p);
Transaction__c t = new Transaction__c();
//if(p.Availability__c >  Decimal.valueOf(qty)){

t.Quantity__c =  Decimal.valueOf(passedobj.qty);
t.Transaction_Amount__c =  Decimal.valueOf(passedobj.price);
t.Transaction_Status__c = 'Success';
t.Products__c = p.id;

//}



return t;

}

global class Jsonparsercls{

String product_id{get;set;}
String price {get;set;}
String qty {get;set;}
list<tktdata> somelidt{get;set;}
     
}

global class tktdata{
list<String> name{get;set;}
Integer Age{get;set;}
list<phonenums> phone{get;set;}   
}
global class phonenums{
String home{get;set;}
String work {get;set;}
}

}