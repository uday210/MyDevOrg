public class getreastaurantscon {

        public String Resdata {get;set;}

        public getreastaurantscon (){}
        
        
        public void getResdata(){
        
            Http http  =new Http();
            HttpRequest req = new HttpRequest();
           // req.setTimeOut(60000);

            req.setHeader('user-key','1e97f74ead93a18fbaa59c1d60d1c114');
            req.setHeader('Content-Type','application/json');
           // req.setHeader('Content-Length', '256');

            req.setMethod('POST');
            req.setEndpoint('https://developers.zomato.com/api/v2.1/collections?city_id=6&count=2');
            
            
            System.debug('>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<');
            System.debug(req);
            HttpResponse res = http.send(req);
            
            Resdata = res.getBody();
          
        
        }
}