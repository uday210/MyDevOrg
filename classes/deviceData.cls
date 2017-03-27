@RestResource(urlMapping='/deviceData/*')
global with Sharing class deviceData {

  
  @HttpPost
  global static String  doPost(){
    RestRequest req = RestContext.request; 
  //    System.debug('>>>>>>>>>>>>>>>>> ');
   Blob body = req.requestBody;
String bodyString = body.toString();
  System.debug('>>>>>>>>>>>>>>>>> ');
 String name;
String company;
//eg. String body = '{"name" : "Michael", "company" : "Sonoma Partners"}';

JSONParser parser = JSON.createParser(bodyString );
while (parser.nextToken() != null) {
  if ((parser.getCurrentToken() == JSONToken.FIELD_NAME)) {
    String fieldName = parser.getText();
    parser.nextToken();
    if (fieldName == 'deviceid') {
      name = parser.getText();
    } 
  }
}

System.debug('>>>>>> '+name);

    // System.debug(ActivityID_List);
    List<Devices__c> devices = [select id,DevicceId__c from Devices__c where DevicceId__c=:name limit 1];
    if(devices.size() == 0){
    Devices__c d = new Devices__c();
    d.DevicceId__c = name;
    insert d;
    }
    return 'success';
// return  [select id,tackfield__c,name,logo__c,(select name, Name__c,  Price__c from Products__r) from Account where    tackfield__c=:name];
  }
  
  


}