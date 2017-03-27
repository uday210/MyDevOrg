global class myscheduleclass implements Schedulable{

    global void execute(SchedulableContext ctx){
    
    Account a = new Account();
    a.name='from Scheduler';
   
   
   insert a;
    
    }
}