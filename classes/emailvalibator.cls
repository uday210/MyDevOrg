public class emailvalibator{




public static String validate_email(String passemail){

        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://email.p.mashape.com/');
        req.setMethod('POST');
        req.setHeader('X-Mashape-Key', 'DIwleJZastmshz4SR9ZC7gAQbA2Qp1qyglnjsnfH45JEbQndE3');
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('Accept', 'application/json');

        JSONGenerator gen = JSON.createGenerator(true);
            gen.writeStartObject();
            gen.writeStringField('email',passemail);
            gen.writeEndObject();

        System.debug('>>>>>>> '+gen.getAsString());
        
        req.setBody(gen.getAsString());
        
        HttpResponse res = http.send(req);
        System.debug(res.getBody());
        
        return res.getBody();

}
}