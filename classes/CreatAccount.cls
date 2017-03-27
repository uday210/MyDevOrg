global class CreatAccount{

    webservice static String MakeAcc(String AccName){
    
        Account a = new Account();
        a.Name = AccName;
        insert a;
        
        return String.valueOf(a.id);
    }
}