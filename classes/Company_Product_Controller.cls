public class Company_Product_Controller {

    public List<Company_Product__c> AllProducts {get;set;}
    
    public Company_Product_Controller (){
    Company_produce_Dao CDAO = new Company_produce_Dao();
    AllProducts  = CDAO.getCompanyData();
    }
    
}