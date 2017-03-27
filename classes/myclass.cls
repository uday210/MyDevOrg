public class myclass {

    public PageReference schedulemethod() {
    
    myscheduleclass aa = new myscheduleclass();
    
    //seconds minutes hours day month year(optional)
    String sch = '00 20 18 24 5 ?';

    String jobID = System.schedule('test Method', sch, aa);

        return null;
    }

}