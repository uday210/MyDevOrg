public virtual class globalforApp{

public String name{get;set;}

public String newname{get;set;}

        public globalforApp(){
        
        name = 'uday';
        
            System.debug('in global class constructure ');
        }
        
        public void commonsettings(){
        
        name = newname;
        }

}