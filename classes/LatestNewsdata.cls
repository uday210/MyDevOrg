public class LatestNewsdata{




@AuraEnabled
public Static LatestNewsService getNews(){

    Http h = new Http();
    HttpRequest req = new httpRequest();
    req.setEndpoint('https://newsapi.org/v1/articles?source=cnbc&apiKey=3be8bc0644fa4106a4c0a8ea249faaff');
    req.setMethod('GET');
    
    Httpresponse res= h.send(req);


return LatestNewsService.parse(res.getBody());
}
}