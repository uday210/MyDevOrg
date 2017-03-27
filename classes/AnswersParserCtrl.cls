public with sharing class AnswersParserCtrl {

public list<list<AnswersParser>> AllAnswers {get;set;} 

 list<AnswersParser> EachResp {get;set;}

    public AnswersParserCtrl (){
   AllAnswers  =  new list<list<AnswersParser>> ();
   for(Form_Responce__c EachAns : [select id,DemoForm__c,responce__c From Form_Responce__c Where DemoForm__c = : apexpages.currentpage().getparameters().get('id')]){
   
          List<String> EachQuestionResponse = EachAns.responce__c.split('#123');
          
          EachResp = new list<AnswersParser>();
          for(String s:EachQuestionResponse){
          EachResp.add(AnswersParser.parse('{'+s.replaceAll('\n','').replaceAll('\r','')+'}'));
          
          }
   
   AllAnswers.add(EachResp );
   
   }
    
   
    }
    
    
}