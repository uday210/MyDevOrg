//
// Generated by PaypalParserForTokenNew http://PaypalParserForTokenNew.herokuapp.com/
//

public class PaypalParserForTokenNew {

public PaypalParserForTokenNew(){}

    public String scope{get;set;}
    public String nonce{get;set;}
    public String access_token{get;set;}
    public String token_type{get;set;}
    public String app_id{get;set;}
    public Integer expires_in{get;set;}

    
    public static PaypalParserForTokenNew parse(String json) {
        return (PaypalParserForTokenNew) System.JSON.deserialize(json, PaypalParserForTokenNew.class);
    }
}