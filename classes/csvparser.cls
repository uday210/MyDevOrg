public class csvparser{

public csvparser(){

}

public void csvfileload(String atta){
 String csvAsString_t ='';
    try{
    csvAsString_t = atta;
    
    System.debug('the data is');
     
     
     List<String> rows = new List<String>();
     rows= csvAsString_t.split('\n');
     
     System.debug(rows.size());
       map<string,String> newmap = new map<String,String>();
     for(integer i=0;i<rows.size();i++)
     {
   
     list<string> eachrow = new list<String>();
     eachrow=rows[i].split(',');
     newmap.put(eachrow[0],eachrow[1]);
     }
     
     System.debug(newmap);
    }catch(Exception e){
    
    }

}



}