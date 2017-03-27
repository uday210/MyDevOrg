public class paypal_pay_con {


public PaypalParserForTokenNew  paypalToken{get;set;}
public PaypalRedirect payredirect {get;set;}


public boolean isdisabled {get;set;}


public String Amount{get;set;}

public String AfterToken {get;set;}

public paypal_pay_con ()

{
isdisabled  = false;
payredirect  = new PaypalRedirect();

paypalToken = new PaypalParserForTokenNew();
map<string,string> pageparams = apexpages.currentpage().getparameters();

if(pageparams.keyset().contains('price')){
Amount =  pageparams.get('price');
isdisabled  = true;

}
}

public pagereference PaypalCall(){
Http http  =new Http();
HttpRequest req = new HttpRequest();
req.setEndpoint('https://api.sandbox.paypal.com/v1/oauth2/token');
req.setMethod('POST');
req.setHeader('Authorization','Basic QVplMDNUNWhXUEdhQVNFQl9zVDAyNjh3Qnp5cFlCSnZfSHNXWjNBaFVHcVVGTjhJb0diLWtSZ2tCR1lmTDRHUDRzd1JJbFFCRWlGUUYyNjI6RUQtVG9ibFNRdFVtcW1QWkhNYjhYN1F3cHFfOHpHdDdLb0QzZUNYd2ZJU0dPbzlhdGZUdldLLWNfQzZFT2NST0VWS3ltWlBjYXhVUGlpWm0=');
req.setHeader('Accept','application/json');
req.setHeader('Accept-Language','en_US');
req.setHeader('Content-Type','application/x-www-form-urlencoded');
String body = 'grant_type=client_credentials';
req.setBody(body);

HttpResponse res = http.send(req);
System.debug(res.getbody());

paypalToken = PaypalParserForTokenNew.parse(res.getbody());
//GotoPaymentGateway(paypalToken.access_token);







Http httpnew  =new Http();
HttpRequest reqnew = new HttpRequest();
reqnew .setEndpoint('https://api.sandbox.paypal.com/v1/payments/payment');
reqnew .setMethod('POST');
reqnew .setHeader('Authorization','Bearer '+paypalToken.access_token);
reqnew .setHeader('Content-Type','application/json');

String bodynew = '{"intent":"sale","redirect_urls":{"return_url":"https://vsmycommunity-developer-edition.ap2.force.com/myTest/apex/Paypal_payment_Success","cancel_url":"http://example.com/your_cancel_url.html"},"payer":{"payment_method":"paypal"},"transactions":[{ "amount":{"total":"'+Amount+'","currency":"USD"}}]}';
reqnew.setBody(bodynew);

HttpResponse resnew = httpnew .send(reqnew);

AfterToken  = resnew.getbody();
payredirect  = PaypalRedirect.parse(AfterToken  );

PageReference pageRef = new PageReference(payredirect.Links[1].href);

return pageRef ;



}

public void GotoPaymentGateway(String PassesToken){

}
}