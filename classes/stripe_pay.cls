public class stripe_pay {


public String Erroris{get;set;}

Public String Amount_pay {get;set;}

public boolean isdisabled {get;set;}
public stripe_pay (){

isdisabled  = false;
map<string,string> pageparams = apexpages.currentpage().getparameters();

if(pageparams.keyset().contains('price')){
Amount_pay =  pageparams.get('price');
isdisabled  = true;

}

}
public String tokenis {get;set;}
public Strip_sucss_verify sf {get;set;}

public Pagereference RedirectPaypalSuccess(){


sf = new Strip_sucss_verify();

System.debug('>>>>> token is '+tokenis );
Http http  =new Http();
HttpRequest req = new HttpRequest();
req.setEndpoint('https://api.stripe.com/v1/charges');
req.setMethod('POST');
req.setHeader('Authorization','Bearer sk_test_ajhRfLCCR4GfpTe8Bq6jym6f');
req.setHeader('Content-Type','application/x-www-form-urlencoded');
String body = 'amount='+Amount_pay+'&currency=usd&source='+tokenis;
req.setBody(body);

HttpResponse res = http.send(req);
System.debug(res.getbody());
if(res.getstatuscode()!=402){
sf = Strip_sucss_verify.parse(res.getbody());
System.debug(sf);
createorder(res.getbody());
}
else if(res.getstatuscode()==402){
Erroris = res.getBody();
}
PageReference pgref = new Pagereference('/apex/Stripe_success');

return null;

}


@future
public static  void createorder(String sf ){

Strip_sucss_verify sff = Strip_sucss_verify.parse(sf );

User_order__c uo = new User_order__c();
uo.Payment_Status__c = sff.status;
uo.Payment_Transaction_ID__c = sff.id;
uo.Payment_Type__c = 'Stripe';
uo.Other_Ref_Id__c = sff.balance_transaction;
uo.Amount__c = sff.amount;
uo.Payment_Responce__c = sf;

insert uo;

}


}