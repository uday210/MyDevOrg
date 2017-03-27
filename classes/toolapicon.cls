public class toolapicon{

public String va{get;set;}
public toolapicon(){

HttpRequest req = new HttpRequest();
req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionID());
req.setHeader('Content-Type', 'application/json');
String domainUrl=URL.getSalesforceBaseUrl().toExternalForm();
system.debug('********domainUrl:'+domainUrl);
req.setEndpoint(domainUrl+'/services/data/v34.0/tooling/query/?q=Select+id,DeveloperName,Sharingmodel,NamespacePrefix+from+CustomObject');
req.setMethod('GET');

Http h = new Http();
HttpResponse res = h.send(req);
system.debug(res.getBody()); 
va=res.getBody();
}
}