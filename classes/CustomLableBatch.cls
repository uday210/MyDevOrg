global class CustomLableBatch implements Database.Batchable<sobject>{

global list<String> CountryNames = System.Label.countryName.split(',');//here countryName is custom lable name
//Start Method
global Database.Querylocator start (Database.BatchableContext BC) {
    //This is the Query which will determine the scope of Records and fetching the same
    return Database.getQueryLocator('Select id, Name,emailAddress__c From Account where country__c IN:CountryNames');
}

//Execute method
global void execute (Database.BatchableContext BC, List<sobject> scope) {
System.debug('scope '+scope);
List<Messaging.SingleEmailMessage> mails =   new List<Messaging.SingleEmailMessage>();

for(sObject a :scope){
    Account AA = (Account)a;
    Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
    
      List<String> sendTo = new List<String>();
      sendTo.add(AA.emailAddress__c);
      mail.setToAddresses(sendTo);
   
    
      // Step 4. Set email contents - you can use variables!
      mail.setSubject('Some Subject');
      String body = 'Dear User' ;
      mail.setHtmlBody(body);
    
      // Step 5. Add your email to the master list
      mails.add(mail);

}
  Messaging.sendEmail(mails);

   }
      


//Finish Method
global void finish(Database.BatchableContext BC){
}


}