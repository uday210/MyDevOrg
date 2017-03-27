public class formDisplayCon {

public String FormHtml {get;set;}
public String FormId {get;set;}

public formDisplayCon(){
FormId = apexpages.currentpage().getparameters().get('id');

DemoForm__c DD = [select id,Data__c from DemoForm__c where id= : apexpages.currentpage().getparameters().get('id')];
FormHtml = DD.Data__c;

}



@RemoteAction
public static String saveAnswers(String Answer,String Parentid){

Form_Responce__c fr =  new Form_Responce__c();
fr.DemoForm__c = Parentid;
fr.responce__c = Answer;

insert fr;
SaveSurveyResponcetoAws(String.valueOf(fr.id),Answer,Parentid);
return 'Success';
}



@future(callout = true)

public static void SaveSurveyResponcetoAws(String id,String responce,String parentid){

responce = responce.replace('"','\'');
responce = '{'+responce+'}';

Http http = new Http();

HttpRequest httpreq = new HttpRequest();

httpreq.setEndpoint('https://amfx35a5tg.execute-api.us-east-1.amazonaws.com/prod/surveyresponce');
httpreq.setMethod('POST');
httpreq.setHeader('Content-Type','application/json');

 JSONGenerator gen = JSON.createGenerator(true);
gen.writeStartObject();
 gen.writeStringField('surveyId', id);
 gen.writeStringField('surveydata', responce);
  gen.writeStringField('parentid', parentid);
 gen.writeEndObject();

String Body = gen.getAsString();
httpreq.setBody(Body);

HttpResponse res = http.send(httpreq);
 
System.debug('>>>>>>>>>>>> parentid'+res.getBody());
System.debug('responce '+responce);
}



}