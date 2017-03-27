public class checksumgen{


public static String genCheckSum(String ORDER_ID,String CUST_ID,String TXN_AMOUNT){


    Http http = new Http();
    HttpRequest req = new HttpRequest();
    req.setEndpoint('http://semicolonend.com/pgRedirect.php');
    req.setMethod('GET');
    req.setHeader('ORDER_ID',ORDER_ID);
    req.setHeader('CUST_ID',CUST_ID);
    req.setHeader('INDUSTRY_TYPE_ID','Retail');
    req.setHeader('CHANNEL_ID','WEB');
    req.setHeader('TXN_AMOUNT',TXN_AMOUNT); 
    
    HttpResponse res = http.send(req);
    System.debug(res);
    
    return res.getBody();
} 



}