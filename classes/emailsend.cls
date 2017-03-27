public class emailsend {

public String toaddress{get;set;}
public String Subject{get;set;}
public string HtmlBody{get;set;}
public blob filedata {get;set;}
public string importedfile {get;set;}

public void sendemail(){

send_emailfromPostMark.send_email(toaddress,Subject,HtmlBody,filedata.toString(),importedfile);
}
}