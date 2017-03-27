public class myDynamicForm{

              
              public static map<String,Country__c>   CountryIdMap = new map<String,Country__c>( [select id,Region__c,Name from Country__c ]);
              
              
               @AuraEnabled
               public String mydata{get;set;}  
                public myDynamicForm(){
                
              
                
                }
             @AuraEnabled
             public static list<Country__c> Allcountries(){
             System.debug('>   > '+CountryIdMap.values());
             
             return CountryIdMap.values();
             }
            
            @AuraEnabled
            public static List<filedConfig> getFields(String SelectedCountryId){
               list<filedConfig> AllFields = new List<filedConfig>();
               
               
               try{
               list<Fields_Config__c> FieldsConfigforSelCountry = [select id,name,
                                                                          FieldName__c,
                                                                          isMandatory__c,
                                                                          isRequired__c,
                                                                          Country__r.Name,
                                                                          Tab__c
                                                                          from Fields_Config__c 
                                                                          where Country__r.id=:SelectedCountryId ];
            
         
            //contact Tab
            for(Fields_Config__c fc:FieldsConfigforSelCountry ){
                AllFields.add(new filedConfig(fc.FieldName__c,fc.isRequired__c,fc.isMandatory__c,fc.Tab__c));
                }
                }catch(Exception ex){
                System.debug('>>>>> exception occured '+ex);
                }
            
            
            return AllFields;
            
            }
            
            
            
            @AuraEnabled
            
            public static String savePr(Partner_request__c userPr){
            
            System.debug('>>>>>>> Passed Pr is '+userPr.Country__c);
            userPr.Country__c = userPr.Country__c;
            Insert userPr;
            
            return  [select name from Partner_request__c where id=:userPr.id].name;
            }
            
            
            
            
            public class filedConfig{
                @AuraEnabled
                public String FieldLabel;
                @AuraEnabled
                public String FieldType;
                @AuraEnabled
                public Boolean isRequired;
                 @AuraEnabled
                public String fieldId;
                @AuraEnabled
                public Boolean isMandatory;
                 @AuraEnabled
                public String Tabis;
                
                public filedConfig(String FieldLabel,String FieldType,boolean isRequired,String fieldId){
                
                    this.FieldLabel = FieldLabel;
                    this.FieldType = FieldType;
                    this.isRequired = isRequired;
                    this.fieldId = fieldId;
                }
                
                public filedConfig(String FieldLabel,boolean isRequired,boolean isMandatory,String Tabis){
                
                    this.FieldLabel = FieldLabel;
                    this.isRequired = isRequired;
                    this.isMandatory = isMandatory;
                    this.Tabis = Tabis;
              
                }
            
            }




}