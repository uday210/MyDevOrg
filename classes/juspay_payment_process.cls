public class juspay_payment_process {



public My_juspayresParse jpParse {get;set;}
public String amount{get;set;}

public juspay_payment_process (){



}

public pagereference juspayInitiate(){



Http http  =new Http();
HttpRequest req = new HttpRequest();
req.setEndpoint('https://api.juspay.in/orders');
req.setMethod('POST');
req.setCompressed(false);
req.setHeader('Authorization','Basic NEVEOTg5NjM3NUQ5NDdFMUEzMEM3RjFEQkI2OUI2NUI6');
req.setHeader('Content-Type','application/x-www-form-urlencoded');


req.setBody('amount='+amount+'&order_id=dfsdflialsjdlaksjdawiwewuiajdis&return_url=https://newworld-dev-ed.my.salesforce.com/apex/juspay_success');

HttpResponse res = http.send(req);
jpParse  = My_juspayresParse.parse(res.getbody());

Pagereference pg = new Pagereference(jpParse.payment_links.web);
return pg;

}
}