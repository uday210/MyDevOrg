public class sendsmsCon{




public static void send_sms(String msg,String phonenumber){


Http http = new Http();
Httprequest req = new Httprequest();
req.setEndpoint('https://webaroo-send-message-v1.p.mashape.com/sendMessage?message='+msg+'&phone='+phonenumber+'\'');
req.setMethod('GET');
req.setHeader('X-Mashape-Key','DIwleJZastmshz4SR9ZC7gAQbA2Qp1qyglnjsnfH45JEbQndE3');
req.setHeader('Accept','application/json');
req.setHeader('Content-Type','application/json');
HttpResponse res = new HttpResponse();
res= http.send(req);
System.debug(res.getbody());

}
}