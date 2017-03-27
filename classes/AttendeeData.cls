@RestResource(urlMapping='/AttendeeData/*')
global with Sharing class AttendeeData {

  
  @HttpPost
  global static  List<Devices__c>  doPost(){
    RestRequest req = RestContext.request; 
  

   
    List<Devices__c> devices = [select id,name,DevicceId__c from Devices__c];
    
    return devices;
  }
  
  


}