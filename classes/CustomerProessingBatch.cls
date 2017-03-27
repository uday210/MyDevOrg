global class CustomerProessingBatch implements Database.Batchable<sobject>,Database.AllowsCallouts{
//Add here your email address
global String toaddress;
global String Subject;
global String HtmlBody;

global CustomerProessingBatch(){}
  
  global CustomerProessingBatch(String toaddress,String Subject,String HtmlBody){
  
  this.toaddress =toaddress;
  this.Subject = Subject;
  this.HtmlBody = HtmlBody;
  }
//Start Method
global Database.Querylocator start (Database.BatchableContext BC) {
    //This is the Query which will determine the scope of Records and fetching the same
    return Database.getQueryLocator('Select id, Name  From Account');
}

//Execute method
global void execute (Database.BatchableContext BC, List<sobject> scope) {

/*
 String temp='Id,Name\n';
 
 for(sobject a:scope){
 
 Account aa = (Account)a;
 
 temp+= aa.id;
 temp+= ',';
 temp+= aa.name;
 temp+='\n';
 }
 

blob csvBlob = Blob.valueOf(temp);   
String encodedString = EncodingUtil.base64Encode(csvBlob);

 send_emailfromPostMark.sendemail(toaddress,Subject,HtmlBody,encodedString,'data.csv');
*/
 
 /*
 try{
     Messaging.EmailFileAttachment attachment = new Messaging.EmailFileAttachment();
attachment.setFileName('ExportData.csv');
attachment.setBody(Blob.valueOf(temp));
attachment.setContentType('text/csv');          
         
                
               String emailMessage = 'Please find attached your exported data as an attachment';                      
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setFileAttachments(new Messaging.EmailFileAttachment[] { attachment } );
                
            
                 
                
                 String[] toAddresses = new String[] {'udaykiran.uday@gmail.com'};//UserInfo.getUserName()
                // mail.setToAddresses(toAddresses);
                 mail.setReplyTo('support@eventdex.com');
                 mail.setSubject('Export data');
                 //mail.setPlainTextBody(emailMessage);
                 mail.setHtmlBody(emailMessage);
                
                 
                 Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
                 }catch(Exception e){}*/
   }
      


//Finish Method
global void finish(Database.BatchableContext BC){

System.debug(System.isScheduled());


//   FutureClass.normalMethod();
  
}


}