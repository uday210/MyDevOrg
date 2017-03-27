public with sharing class searchCon {

public boolean show {get;set;}
public void showdata(){

show  = true;
    // this will sort on the basis of Comparable
bulkdata.sort();
}

    public PageReference add() {
    bulkdata.add(new myinner());
    

        return null;
    }


    public PageReference saveall() {
    System.debug('>>>>>> '+bulkdata);
        return null;
    }


public list<myinner> bulkdata{get;set;}

public String serachkey{get;set;}

public searchCon(){
show = false;
bulkdata = new  list<myinner> ();
bulkdata.add(new myinner());
System.debug('In constructure');
}


public void gerAccs(){
System.debug('>>>>>>>>>> '+serachkey);


}

//implementing comparable interface for this class
public class myinner implements Comparable{
public String name{get;set;}
public integer age{get;set;}
public myinner(String name,integer age){
this.age = age;
this.name = name;

}
public myinner(){

}

public integer compareTo(Object passed){


integer returnval = 0;
 
 myinner a = (myinner )passed;
 
 if(age > a.age)
 {
 returnval = 1;
 }else if(age < a.age)
 {
 returnval =+1;
 }
 
            return returnval ;
}
}
}