public class PaypalPayment_Accept {
    
    public Map<String,String> pageparams {get;set;}
    public String PayerID {get;set;}
    public String paymentId{get;set;}
    public String token{get;set;}
    public PaypalParserForTokenNew  paypalToken{get;set;}
    public Paypal_confirmation paypalApp{get;set;}
    
    
    public PaypalPayment_Accept (){
    paypalToken = new PaypalParserForTokenNew();
    paypalApp = new Paypal_confirmation();
    pageparams = ApexPages.CurrentPage().getParameters();
    PayerID  = ApexPages.CurrentPage().getParameters().get('PayerID');
    paymentId = ApexPages.CurrentPage().getParameters().get('paymentId');
   token = ApexPages.CurrentPage().getParameters().get('token');
    
    
    }
    
   Public String AfterApproval {get;set;} 
    public void ApproveData(){
    
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





//Approval Logic


Http httpnew  =new Http();
HttpRequest reqnew = new HttpRequest();
reqnew .setEndpoint('https://api.sandbox.paypal.com/v1/payments/payment/'+paymentId+'/execute');
reqnew .setMethod('POST');
reqnew .setHeader('Authorization','Bearer '+paypalToken.access_token);
reqnew .setHeader('Content-Type','application/json');
String bodynew = '{"payer_id":"'+PayerID+'"}';
reqnew .setBody(bodynew);

HttpResponse resnew = httpnew .send(reqnew);

AfterApproval = resnew.getbody();
paypalApp = Paypal_confirmation.parse(AfterApproval );



//Approval Execution Logic
    
    
    
    }
}