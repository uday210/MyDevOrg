global class sample{

public list<student> stulist {get;set;}

global sample(){
stulist  = new list<student>();
stulist.add(new student('uday',25));
stulist.add(new student('sai',21));
stulist.add(new student('surya',35));
stulist.add(new student('Balu',55));
stulist.add(new student('Mahi',12));

// this will sort on the basis of Comparable
stulist.sort();

}



global class student implements Comparable{
public String name {get;set;}
public Integer age{get;set;}

global student(String name,Integer age){
this.name = name;
this.age = age;
}

 global Integer compareTo(Object ObjToCompare) {
 
 Integer returnval = 0;
 
 student a = (student)ObjToCompare;
 
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