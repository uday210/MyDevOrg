public class myPaytmCon {


//define('PAYTM_ENVIRONMENT', 'TEST'); // PROD
//define('PAYTM_MERCHANT_KEY', '4S&d_i#KGhDzAJAb'); //Change this constant's value with Merchant key downloaded from portal
//define('PAYTM_MERCHANT_MID', 'Global15892989980511'); //Change this constant's value with MID (Merchant ID) received from Paytm
//define('PAYTM_MERCHANT_WEBSITE', 'localhost'); //Change this constant's value with Website name received from Paytm
//Content-type' : 'text/json','Cache-Control': 'no-cache'

public String paytmpg {get;set;}


public void gitpaytm(){

Http http  = new Http();

HttpRequest req = new HttpRequest();
//req.setEndpoint('https://pguat.paytm.com/oltp-web/processTransaction');

req.setEndpoint('http://semicolonend.com/TxnTest.php');
req.setMethod('GET');
//req.setHeader('Content-type','text/json');
//req.setHeader('Cache-Control','no-cache');
HttpResponse res = http.send(req);

System.debug(res.getBody());

paytmpg  = res.getBody();

}
}