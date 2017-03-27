global class b1 implements Database.Batchable<sObject>{

    global final String query;
    
    global final String s_object;
    
    global final String Field;
    global final String field_value;
    
    
    global b1(String q,String s,String f,String v){
    
    query=q;
    s_object =s;
    Field=f;
    field_value=v;
    }
    //start method
    global Database.QueryLocator start (Database.BatchableContext BC){
    return Database.getQueryLocator(query);
    } 
    //execute method
    global void execute (Database.BatchableContext BC,List<sObject> bat){
    
    for(sObject o:bat){
    o.put(Field,field_value);
    }
    System.debug(bat);
    update bat;
    }
    
   
    
    global void finish(Database.BatchableContext BC){
    
    }
    
    

}