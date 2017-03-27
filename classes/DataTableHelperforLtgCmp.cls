public class DataTableHelperforLtgCmp{
 
 
    public DataTableHelperforLtgCmp(){
       ///constructure
        }
  

    
     @AuraEnabled
    public static DataTableWrapper processData(Integer start,Integer size,String lasRecordIDinView,String FirstRecIdInView,String movingIs){
                 
       String ordering = 'ASC';         
       String  queryString = 'select id,Name,First_Name__c,Last_Name__c,Email__c from Partner_request__c ';//Base query
       Integer noOfRecords = [select count() from Partner_request__c ];
       if(lasRecordIDinView != 'initial')
        {    
            if(movingIs == 'forward'){
            queryString += ' where Name > \''+lasRecordIDinView+'\'';
            ordering  ='ASC';
            }
            
            if(movingIs == 'backword'){
            queryString += ' where Name < \''+FirstRecIdInView+'\'';
            ordering = 'DESC';
            }
        }
        
        queryString +=' order by Name '+' limit '+size;

        integer i = 0;
        
      
        System.debug('start value: '+start);
        
       
        System.debug('size value : '+size);


        
      Integer TotalNumberOfViews = ( noOfRecords /size);
      //List<sobject> contactList = setCon.getRecords();
      system.debug('>>>>> queryString  '+queryString );
        List<SObject> contactList = Database.query(queryString);

        
      //create wrapper
        DataTableWrapper datawrap = new DataTableWrapper(0,noOfRecords,noOfRecords,contactList,TotalNumberOfViews );
        
        
        return datawrap;
         
    }

    public class DataTableWrapper{
    //these parameters Datatable expects from server , those are[draw,recordTotal,recordFiltered,data(this is a array))]
    @AuraEnabled
        public boolean selected{get; set;}
    @AuraEnabled
        public Integer draw;
    @AuraEnabled
        public Integer recordsTotal;
    @AuraEnabled
        public Integer recordsFiltered;
    @AuraEnabled
        public List<sobject> data;
    @AuraEnabled            
        public Integer TotalNumberOfViews ;
      //  public List<Contact> allids;
        public DataTableWrapper(Integer draw,Integer recordsTotal,Integer recordsFiltered,list<contact> data,Integer TotalNumberOfViews ){
            this.draw = draw;
            this.recordsTotal = recordsTotal;
            this.recordsFiltered = recordsFiltered ;               
            this.data = data;
            this.TotalNumberOfViews  = TotalNumberOfViews ;
              
        }
         
    }
    
}