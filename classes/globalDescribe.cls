public class globalDescribe{

 Public Map<String, Schema.SObjectType> AllObjmap;

public list<ObjectData> Alldata  {get;set;}

public Boolean ShowTable {get;set;}
public boolean GetTemplateForBulApi{get;set;}


public String  ObjIs {get;set;}

Public List<selectoption> getObjList(){
    List<selectoption> objList = new List<selectoption>();
    for(string s:AllObjmap.keyset()){
        objList.add(new selectoption(s,s));
    }
  return objList;   
 }

public globalDescribe(){
GetTemplateForBulApi = false;
ShowTable  = false;
 AllObjmap = New Map<String, Schema.SObjectType>();
    AllObjmap = Schema.getGlobalDescribe();
      
     Alldata  = new list<ObjectData>();
       

}


public void getMydata(){
ShowTable =true;
GetTemplateForBulApi  = true;
 Alldata  = new list<ObjectData>();
            //use GlobalDecribe to get a list of all available Objects
            Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
            Set<String> objectKeys = gd.keySet();
        for(String objectKey: objectKeys)
    {
            //Iterate through all objects to locate ACCOUNT Object
            if (objectKey == ObjIs  ) 
            {
                Schema.SObjectType systemObjectType = gd.get(objectKey);
                Schema.DescribeSObjectResult r = systemObjectType.getDescribe();
                Map<String, Schema.SObjectField> M = r.fields.getMap();
                Set<String> fieldNames = M.keySet();

                             
        
                //iterate through all fields of the object to locate the field
                for(String fieldName: fieldNames)
                {
       
             
               Schema.SObjectField field = M.get(fieldName);
                Schema.DescribeFieldResult fieldDesc = field.getDescribe();
                //extract the picklist valuee
                System.debug(fieldDesc.getPicklistValues() + ' ::::::::::::::::::::::::::::::::::: ') ;
                String AllPickVals = '' ;
                if(fieldDesc.getPicklistValues().size() != 0){
                    for(Schema.PicklistEntry eac:fieldDesc.getPicklistValues()){
                    
                           AllPickVals += eac.getValue() +',';
                    }
                
                }
                Alldata.add(new ObjectData(fieldName,AllPickVals,fieldDesc.getType(),fieldDesc.getLabel()  ));
            
            }
    }
  
  }
 }

  
  public class ObjectData{
  
  public String fieldName{get;set;}
  public String picklistValues {get;set;}  
  public Schema.DisplayType fieldType{get;set;}  
  public String FieldLabel {get;set;}
  
  public ObjectData(String fieldName,String picklistValues,Schema.DisplayType fieldType,String FieldLabel ){
     this.picklistValues  = picklistValues ;
     this.fieldName = fieldName;
     this.fieldType = fieldType;
      this.FieldLabel =FieldLabel;
  }
  
  }
  
  
  public PageReference getxlsFile(){
  
  PageReference pgref = new PageReference('/apex/ObjectDetails');
        pgref.setRedirect(false);
        return pgref;
  }
  
  
    public PageReference getBulkApiTemplateFile(){
  
  PageReference pgref = new PageReference('/apex/BulkApiTemplate');
        pgref.setRedirect(false);
        return pgref;
  }
  
  }