global without sharing class BatchCsvImport implements Database.batchable<List<String>>, Database.Stateful,Database.AllowsCallouts
{
   List<List<String>> allFields;
   LIST<importcsvcon.header> gridrows;
   String mailCSVAttachment;
   Integer K;
   
   //constructure
    public BatchCsvImport(List<List<String>> allFields,LIST<importcsvcon.header> gridrows){
    this.allFields=allFields;
    this.K = 0;
    this.gridrows=gridrows;
    mailCSVAttachment = '';
      
      for(integer j=0;j<gridrows.size();j++){
          if(j==0){
          if(gridrows[j].csvheader !=null && gridrows[j].csvheader != ''){
              mailCSVAttachment = mailCSVAttachment + gridrows[j].csvheader;
              System.debug('======= '+mailCSVAttachment);
              }
          }
          else{
            if(gridrows[j].csvheader !=null && gridrows[j].csvheader != ''){
              mailCSVAttachment = mailCSVAttachment + ',' + gridrows[j].csvheader;
              System.debug('++++++++ '+mailCSVAttachment);
              
              }
          }
      }
      
     mailCSVAttachment = mailCSVAttachment + '\n';
   
      }
      
      //start method
     
   global Iterable<List<String>> start(Database.batchableContext batchableContext)
   { 
            
      System.debug('==>==>==> '+new BatchListIterator(allFields));
       return new BatchListIterator(allFields);
   }
   
   //execute method
   global void execute(Database.BatchableContext batchableContext, List<List<String>> scope)  
   {
      list<Account> myacc =new list<Account>();

       //TODO: Create a map with the column name and the position.
       
      for(integer i=0;i<scope.size();i++)
      {
      Account a  = new Account();
           List<String> eachrowrecord=scope[i];
           
           for(integer j=0;j<gridrows.size();j++)
           {
              if(gridrows[j].field!='')
              {
                  if(gridrows[j].field=='srno__c'){
                  if(eachrowrecord[j]!=null&&eachrowrecord[j]!=''){
                  a.AccountNumber=eachrowrecord[j].trim();
                  }
                 // tktProfileObject.put(gridrows[j].field,eachrowrecord[j].trim());
                  }
                  if(gridrows[j].field=='First_Name__c'){
                  if(eachrowrecord[j]!=null&&eachrowrecord[j]!=''){
                  a.name=eachrowrecord[j].trim();
                  }
                 // tktProfileObject.put(gridrows[j].field,eachrowrecord[j].trim());
                  }
                  if(gridrows[j].field=='Last_Name__c'){
                  if(eachrowrecord[j]!=null&&eachrowrecord[j]!=''){
                  a.Site=eachrowrecord[j].trim();
                  }
                 // tktProfileObject.put(gridrows[j].field,eachrowrecord[j].trim());
                  }
                  if(gridrows[j].field=='gender__c'){
                  if(eachrowrecord[j]!=null&&eachrowrecord[j]!=''){}
                 // tktProfileObject.put(gridrows[j].field,eachrowrecord[j].trim());
                  }
                  if(gridrows[j].field=='Email__c'){
                  if(eachrowrecord[j]!=null&&eachrowrecord[j]!=''){}
                 // tktProfileObject.put(gridrows[j].field,eachrowrecord[j].unescapeCsv().trim());
                  }
                  
       
                 
                    
              }
           }
           myacc.add(a);
  
      k++;
      
      String eachrowValue = String.valueOf(eachrowrecord);
      if(eachrowValue.startswith('(')){
          eachrowValue = eachrowValue.Substring(1,eachrowValue.length());
      }
      if(eachrowValue.endswith(')')){
          eachrowValue = eachrowValue.Substring(0,eachrowValue.length()-1);
      }
         mailCSVAttachment = mailCSVAttachment + eachrowValue+'\n';
      }
      
      bulkAccinsert.insertaccs(myacc);
   }
   global void finish(Database.BatchableContext batchableContext){
   
   Account abc = new Account();
   abc.name = 'test acc 1991';
   insert abc; 
   
          AsyncApexJob a = [Select Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email, ExtendedStatus from AsyncApexJob where Id = :batchableContext.getJobId()]; 
     System.debug('Finish Method '+a);
     String htmlbody = 'import Status is '+ a.Status+'<br/>';
             htmlbody += 'total JobItemsProcessed '+a.JobItemsProcessed+'<br/>';
             htmlbody += 'total TotalJobItems'+a.TotalJobItems+'<br/>';
             htmlbody += 'total NumberOfErrors'+a.NumberOfErrors+'<br/>';
             blob csvBlob = Blob.valueOf(mailCSVAttachment );   
            String encodedString = EncodingUtil.base64Encode(csvBlob);

             
     send_emailfromPostMark.sendemail('udaykiran.uday@gmail.com','import Status',htmlbody ,encodedString ,'importeddata.csv');
   }
   
 
}