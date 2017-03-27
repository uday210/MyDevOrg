public class PaypalParserForToken {

public PaypalParserForToken(){}

	public String scope{get;set;}
	public String nonce{get;set;}
	public String access_token{get;set;}
	public String token_type{get;set;}
	public String app_id{get;set;}
	public Integer expires_in{get;set;}

	
	public static PaypalParserForToken parse(String json) {
		return (PaypalParserForToken) System.JSON.deserialize(json, PaypalParserForToken.class);
	}
}