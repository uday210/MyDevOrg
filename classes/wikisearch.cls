/******new http class**/

public class wikisearch{

@AuraEnabled
public static String getWkisearch(String searchKey,integer SearchLimit){

		//initialise HTTPRequest
		HttpRequest req = new HttpRequest();
		
		//Set end point
		req.setEndpoint('https://en.wikipedia.org/w/api.php?action=opensearch;search='+searchKey+';limit='+SearchLimit+';namespace=0;format=json');

		//Set Http Verb (GET,POST e.t.c)
		req.setMethod('GET');
		
		//new Create  a HTTP Module
		
		Http http = new Http();
		
		//send req and catch Response
		
		HttpResponse res = http.send(req);

		//return response body
		return res.getBody();

}

}