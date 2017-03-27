@RestResource(urlMapping='/samplerest/*')
global with sharing class MyRestResource {
    @HttpGet
    global static void getRecord() {
    
        // Add your code
        
        RestRequest request = RestContext.request;

        System.debug('=====================> '+request.params.get('iid'));
        
       // HttpResponse res = new HttpResponce();
        //res.header('Access-Control-Allow-Origin', '*')
        //res.setBody([select id,name from Account]);
        RestContext.response.addHeader('Access-Control-Allow-Origin', '*');
        String name = RestContext.request.params.get('name');
        RestContext.response.responseBody = Blob.valueOf(JSON.serialize([select id,name,Deal_created_On__c,Deal_description__c,Deal_from__c,Deal_image_url__c,Deal_name__c,Price__c from Alltricks_deals__c]));

        
       // return res;
    }
    
    
    
     @HttpPost
    global static void savePr() {
    RestRequest request = RestContext.request;
    Blob prdata =     request.requestBody;
   
    try{
         System.debug('>>>request   '+request );
        RestContext.response.addHeader('Access-Control-Allow-Origin', '*');
        RestContext.response.addHeader('Access-Control-Allow-Methods', 'POST');
        
      //   JSONParser parser = JSON.createParser(String.valueOf(prdata) );

        
       //  Partner_request__c inv = ;
    PRparser pr =    PRparser.parse(prdata.toString());
       
         Partner_request__c inv = new Partner_request__c ();
       inv.First_Name__c =  pr.First_Name;
       inv.Email__c = pr.Email;
         
    insert inv;
        
       RestContext.response.responseBody =   Blob.valueof(String.valueOf(inv ));
         }catch(exception ex){
         
          RestContext.response.responseBody =  Blob.valueof(String.valueOf(ex.getMessage()));
         }
    }
    
    
    
    
}