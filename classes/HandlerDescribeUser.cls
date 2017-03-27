public  class HandlerDescribeUser implements BotHandler {
    
    public BotResponse handle(String utterance, String[] params, Map<String, String> session) {
    
    
    
     List<BotRecord> records = new List<BotRecord>();
        
  
            List<BotField> fields = new List<BotField>();
            fields.add(new BotField('first name', userinfo.getFirstName() ));
            fields.add(new BotField('last name', userinfo.getLastName() ));
            fields.add(new BotField('locale', userinfo.getLocale() ));
            fields.add(new BotField('Profile ', userinfo.getProfileId() ));
            fields.add(new BotField('Time Zone', String.valueOf(userinfo.getTimeZone()) ));
            fields.add(new BotField('Email ', userinfo.getUserEmail() ));
            fields.add(new BotField('user Type', userinfo.getUserType() ));
            
            records.add(new BotRecord(fields));
      
        return new BotResponse(new BotMessage('Bot', 'Here is the User Description :', records));
       // return new BotResponse(new BotMessage('Bot', 'this is uday'));
    }
    
}