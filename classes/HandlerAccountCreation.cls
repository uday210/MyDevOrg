public class HandlerAccountCreation  implements BotHandler{

public BotResponse handle(String utterance, String[] params, Map<String, String> session) {

 if (session == null) {
            session = new Map<String, String>();
            session.put('nextCommand', 'HandlerAccountCreation');
            session.put('step', 'askAccountName');
            return new BotResponse(new BotMessage('Bot', 'What\'s the Account Name?'), session);
        }
        String step = session.get('step');
        if (step == 'askAccountName') {
           session.put('accname', utterance);
            session.put('nextCommand', 'HandlerAccountCreation');
            session.put('step', 'askEmailaddress');
         
            return new BotResponse(new BotMessage('Bot', 'What\'s the Email Address?'), session);
        } else if(step  == 'askEmailaddress'){
        
              Account a = new Account();
              a.Name  = session.get('accname');
              a.emailAddress__c= utterance;
              insert a;
          
           List<BotRecord> records = new List<BotRecord>();

                List<BotField> fields = new List<BotField>();
           
                fields.add(new BotField('Account', a.Name, '#/sObject/' + a.Id + '/view'));
                records.add(new BotRecord(fields));
                BotMessage message = new BotMessage('Bot', 'Accoutn Got Created:', records);
                
                return new BotResponse(message);
            
         }

 return new BotResponse(new BotMessage('Bot', 'creating Account'));
}

}