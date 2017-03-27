public class customsettingscon {

public List<food__c> ff {get;set;}

public customsettingscon (){
ff  =food__c.getall().values();
}
}