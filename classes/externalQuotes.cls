public class externalQuotes{

public static Map<String, object> results{get;set;}

public externalQuotes(){

results = new Map<String, object>();
}


@future(callout=true)
public Static void  quotes(id itemid){


Http http = new Http();
HttpRequest request = new HttpRequest();
request.setEndpoint('https://aqueous-plains-52547.herokuapp.com/products');
request.setMethod('GET');
HttpResponse response = http.send(request);
// If the request is successful, parse the JSON response.
if (response.getStatusCode() == 200) {
    // Deserialize the JSON string into collections of primitive data types.
     results = (Map<String, object>) JSON.deserializeUntyped(response.getBody());
  
   
}
items__c i = new items__c();
i.id = itemid;
i.Cost__c =(Integer) results.get('phone');


System.debug('++++++++++++++++ '+i);
try{
update i;
}catch(Exception e){

System.debug('eeeeeeeeeeeeeeee '+e);

}
 //return results;
}

}