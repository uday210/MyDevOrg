public class sendsms {
public String msg{get;set;}
public String num{get;set;}


public void send(){
sendsmsCon.send_sms(msg,num);
}
}