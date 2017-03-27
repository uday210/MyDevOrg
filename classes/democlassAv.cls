public with sharing class democlassAv {

    //lets initialize a string
    
    public String Username {get;set;}
    
    public Account Acc{get;set;} //creating a coppy of Account Object


        //this is constructure
        
        public democlassAv(){
        
        Acc = new Account(); //creating Memory 
        
        Username = 'Anvesh';
        }
        
        
        //lets write A simple method
        
        public void changeName(){
        
         Username = 'Uday';
        
        }
        
        
        public void saeAccount(){
        
        insert Acc;
        
        }
}