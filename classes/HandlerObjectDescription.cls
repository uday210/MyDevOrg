public with sharing class HandlerObjectDescription implements BotHandler {
    
    public BotResponse handle(String utterance, String[] params, Map<String, String> session) {
        return new BotResponse(new BotMessage('Bot', 'Exprting '+params[0]));
    }
    
}