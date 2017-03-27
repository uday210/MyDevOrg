public class weatherwidget{


        @AuraEnabled
        public static String getweatherData(){
        
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndPoint('http://api.openweathermap.org/data/2.5/weather?q=hyderabad&appid=cd5ef1cf893ea59a64d2995b2d561283');
        req.setMethod('GET');
        
        HttpResponse res = h.send(req);
        return res.getBody();
        
        }
}