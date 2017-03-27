public class FlipkartrAffiliate{

public Transient string datais {get;set;}

public Transient Flipkart fk {get;set;}

public Transient list< Flipkart.AllOffersList > fkn {get;set;}

public FlipkartrAffiliate(){
datais  = '';
 fk = new Flipkart();

}

public void getflipartdata(){
 fkn = new list< Flipkart.AllOffersList >();


Http http = new Http();
HttpRequest request = new HttpRequest();
request.setEndpoint('https://affiliate-api.flipkart.net/affiliate/offers/v1/all/json');
request.setMethod('GET');
request.setHeader('Fk-Affiliate-Id','udaykiran16');
request.setHeader('Fk-Affiliate-Token','2e7dac1211964179b172c1321c66d1a8');
HttpResponse response = http.send(request);
// If the request is successful, parse the JSON response.
if (response.getStatusCode() == 200) {
    // Deserialize the JSON string into collections of primitive data types.
    datais  = response.getBody();
    fk = Flipkart.parse(datais);
    
    
    Integer i = 0;
    //System.debug(fkn.allOffersList);
    for(Flipkart.AllOffersList AA:fk.allOffersList){
    
    fkn.add(AA);
    i++;
    
    if(i == 100)
    break;
    }
    }
}

/****************Search Data*****************/



public Transient flipkartserachparser fp{get;set;}
public String queryis {get;set;}
public String   dataisserach{get;set;}
public void getflipartdatasearch(){
  fp = new flipkartserachparser();
Http http = new Http();
HttpRequest request = new HttpRequest();

queryis = queryis.replace(' ','+');
request.setEndpoint('https://affiliate-api.flipkart.net/affiliate/search/json?query='+queryis+'&resultCount=25');
request.setMethod('GET');
request.setHeader('Fk-Affiliate-Id','udaykiran16');
request.setHeader('Fk-Affiliate-Token','2e7dac1211964179b172c1321c66d1a8');
HttpResponse response = http.send(request);
// If the request is successful, parse the JSON response.
if (response.getStatusCode() == 200) {
    // Deserialize the JSON string into collections of primitive data types.
   dataisserach  = response.getBody();
    fp = flipkartserachparser.parse(dataisserach);
    
    
    }
}
}