@RestResource(urlMapping='/getAccDetailsNew/*')
global with Sharing class getAccDetailsNew{
  @HttpGet
  global static List<Account> doGet(){
      RestRequest req = RestContext.request; 
      
//      return 'https://uk-boothleads.cs23.force.com/Eventdex/BLN_Registration_OnlyTickets?id=a1918000000TuO4AAK';
 
 //return '<iframe src="http://www.w3schools.com"></iframe>';
return  [select id,name from Account];
  }
  
  
  
  @HttpPost
  global static List<Account> doPost(){
 

    // System.debug(ActivityID_List);
 return  [select id,name,logo__c,tackfield__c from Account order by tackfield__c limit 100  ];
  }
  
  


}