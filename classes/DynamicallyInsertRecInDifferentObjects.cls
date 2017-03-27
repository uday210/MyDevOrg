public Class DynamicallyInsertRecInDifferentObjects{





        public static String  insertAnewrecord(String ObjectApiName, Map<String,object> FieldApiAndVale)
        {
        
                sObject sObj = Schema.getGlobalDescribe().get(ObjectApiName).newSObject() ;

              //  newObj.setType(ObjectApiName);
                
                for(String eachField:FieldApiAndVale.keySet()){
                
                
                sObj.put(eachField, FieldApiAndVale.get(eachField));
                }
                
                
                insert sObj;
                
                
                return String.valueOf(sObj.id);
                       
        
        }    
        
        
        
        
        public static list<String>  insertMultipleRecords(Map<String,Map<string,object>> mapofDifferentRecods){
        
        
        list<sobject> myRecords = new list<sobject>();
        
                    for(String ObjectApiName:mapofDifferentRecods.keyset()){
                    
                    
                             sObject sObj = Schema.getGlobalDescribe().get(ObjectApiName).newSObject() ;

              //  newObj.setType(ObjectApiName);
                
                for(String eachField:mapofDifferentRecods.get(ObjectApiName).keySet()){
                
                
                sObj.put(eachField, mapofDifferentRecods.get(ObjectApiName).get(eachField));
                }
               
                    myRecords.add(sObj );
                    
                    
                    
                    }
        insert myRecords;
        list<String> allids = new list<String>();
        for(sobject each:myRecords){
        allids.add(each.id);
        
        }
        return allids;
        }
            
            




}