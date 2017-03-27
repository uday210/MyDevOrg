@RestResource(urlMapping='/getAccDetailsMore/*')
global with Sharing class getAccDetailsMore{
  @HttpGet
  global static List<Account> doGet(){
      RestRequest req = RestContext.request; 
      
//      return 'https://uk-boothleads.cs23.force.com/Eventdex/BLN_Registration_OnlyTickets?id=a1918000000TuO4AAK';
 
 //return '<iframe src="http://www.w3schools.com"></iframe>';
return  [select id,name from Account];
  }
  
  
  
  @HttpPost
  global static List<Account> doPost(){
    RestRequest req = RestContext.request; 
  //    System.debug('>>>>>>>>>>>>>>>>> ');
   Blob body = req.requestBody;
String bodyString = body.toString();
  System.debug('>>>>>>>>>>>>>>>>> ');
  System.debug('+++++++ ' +bodyString );
 String name;
String company;
//eg. String body = '{"name" : "Michael", "company" : "Sonoma Partners"}';

JSONParser parser = JSON.createParser(bodyString );
while (parser.nextToken() != null) {
  if ((parser.getCurrentToken() == JSONToken.FIELD_NAME)) {
    String fieldName = parser.getText();
    parser.nextToken();
    if (fieldName == 'accname') {
      name = parser.getText();
    } 
  }
}

System.debug('>>>>>> '+name);

    // System.debug(ActivityID_List);
  return  [select id,name,logo__c,tackfield__c from Account where tackfield__c >:name order by tackfield__c   limit 100];
  }
  
  


}