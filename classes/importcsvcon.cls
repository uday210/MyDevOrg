public class importcsvcon {
public string csvAsString{get;set;}
public blob csvFileBody{get;set;}
 public List<header> gridrows{get;set;}
 public List<SelectOption> fieldsoptions{get;set;}
 
List<List<String>> allFields = new List<List<String>>(); // store all the fields in this variable

public pagereference importCSVFile(){
    if(csvFileBody==null)
    {
    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please select a File. to import');
    ApexPages.addMessage(myMsg);
    return null;
    }
    
    String csvAsString = csvFileBody.toString();
    csvFileBody=null;
    allFields=parseCSV(csvAsString,false);//call a method
    System.debug('allFields uday'+allFields);
    List<String> headerrow=new List<String>();
     gridrows=new List<header>();
      fieldsoptions=new List<SelectOption>();
    fieldsoptions.add(new SelectOption('','--None--'));
    fieldsoptions.add(new SelectOption('srno__c','Roll No'));
    fieldsoptions.add(new SelectOption('First_Name__c','First_Name'));
    fieldsoptions.add(new SelectOption('Last_Name__c','Last_Name'));
    fieldsoptions.add(new SelectOption('gender__c','gender'));
    fieldsoptions.add(new SelectOption('Email__c','email'));
    
       for(String s:allFields[0])
    {
     header gr=new header();
     gr.csvheader=s;
     For(SelectOption so : fieldsoptions)
     {
       if(gr.csvheader.contains(so.getlabel()))
       {
         gr.field=so.getvalue();
         break;
       }
     }
     gridrows.add(gr);
    }
      
return null;
}


public static List<List<String>> parseCSV(String contents,Boolean skipHeaders) {
    List<List<String>> allFields = new List<List<String>>();

    // replace instances where a double quote begins a field containing a comma
    // in this case you get a double quote followed by a doubled double quote
    // do this for beginning and end of a field
    contents = contents.replaceAll(',"""',',"DBLQT').replaceall('""",','DBLQT",');
    // now replace all remaining double quotes - we do this so that we can reconstruct
    // fields with commas inside assuming they begin and end with a double quote
    contents = contents.replaceAll('""','DBLQT');
    // we are not attempting to handle fields with a newline inside of them
    // so, split on newline to get the spreadsheet rows
    List<String> lines = new List<String>();
    try {
        lines = contents.split('\n');
    } catch (System.ListException e) {
        System.debug('Limits exceeded?' + e.getMessage());
        
        }
    Integer num = 0;
    for(String line: lines) {
    
        // check for blank CSV lines (only commas)
        if (line.replaceAll(',','').trim().length() == 0) break;
        
        List<String> fields = line.split(',(?=([^\"]*\"[^\"]*\")*[^\"]*$)', -1); 

        
        List<String> cleanFields = new List<String>();
        String compositeField;
        Boolean makeCompositeField = false;
        
        for(String field: fields) {
        field = field.trim();
            if (field.startsWith('"') && field.endsWith('"')) {
                field= field.substring(1, field.length() - 1);
                cleanFields.add(field.replaceAll('DBLQT','"'));
                } else if (field.startsWith('"')) {
                makeCompositeField = true;
                compositeField = field;
                
            } else if (field.endsWith('"')) {
                compositeField += ',' + field;
                cleanFields.add(compositeField.replaceAll('DBLQT','"'));
                makeCompositeField = false;
            } else if (makeCompositeField) {
                compositeField +=  ',' + field;
            } else {
                cleanFields.add(field.replaceAll('DBLQT','"'));
            }
        }
        
        allFields.add(cleanFields);
    }
    if (skipHeaders) allFields.remove(0);
    return allFields;       
}

 public class header
   {
     public String csvheader{get;set;}
     public String field{get;set;}
     
   }
   
   
   public PageReference Import()
    {
    System.debug('in import '+gridrows);
   
    if(allFields.size()==1)
    {
      ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please enter atleast one record in the file');
    ApexPages.addMessage(myMsg); 
    return null;
    }
    
     allFields.remove(0);
    //Id batchInstanceId = Database.executeBatch(new BLN_BatchImportAttendee(allFields, gridrows,selecteditem), 2);
    //PageReference pg=new PageReference('/apex/BLN_Attendees');
    //pg.setRedirect(true);
    
         Id batchInstanceId = Database.executeBatch(new BatchCsvImport(allFields, gridrows),20); 
         
         System.debug('>>>>>>>>>>>> '+batchInstanceId );
    return null;
    }
      
}