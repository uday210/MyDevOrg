public class BusScheduleCache{


    private Cache.OrgPartition part;




    public BusScheduleCache(){
    part = Cache.Org.getPartition('local.BusSchedule');

    
    }
    
    public void putSchedule(String busLine, Time[] schedule){}
    
    
    
    public Time[] getSchedule(String busLine){
    
    
    if (part.get(busLine) != null) {

    return (Time[]) part.get(busLine);
    }else{
    list<Time> tt = new list<Time>();
    tt.add(Time.newInstance(8,0,0,0));
    tt.add(Time.newInstance(17,0,0,0));
    
    return tt;
    }

    } 



}