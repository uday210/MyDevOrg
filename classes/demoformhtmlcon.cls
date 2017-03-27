global class demoformhtmlcon {


public PageReference getResp(){
PageReference pg  = new PageReference('/apex/AnswersDisplay?id='+FormIdis);
pg.setRedirect( true);
return pg;

}


public String FormIdis {get;set;}
//AnswersDisplay

@RemoteAction
global static String savehtml(String html){

DemoForm__c d = new DemoForm__c();
d.Data__c = html;

insert d;
return d.id;
}
public String recid {get;set;}

public Boolean show {get;set;}

public demoformhtmlcon(){
recid = '';
show = true;

}
public PageReference generateLink(){
show= true;

recid = apexpages.currentpage().getparameters().get('recid');
return null;

}


}