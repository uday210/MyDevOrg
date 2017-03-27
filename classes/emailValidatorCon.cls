public class emailValidatorCon {

public String response {get;set;}
public string enteredemail{get;set;}
public Jsonparsercls data {get;set;}

public boolean display{get;set;}

public emailValidatorCon (){
        data  = new Jsonparsercls ();
        display = false;
}

public void checkemail(){

display = true;

response  = emailvalibator.validate_email(enteredemail);

JSONParser parser = JSON.createParser(response  );
     while (parser.nextToken() != null) {
         if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
               data   = (Jsonparsercls)parser.readValueAs(Jsonparsercls.class);
               
            
            }
                        
      }


}

public class Jsonparsercls{

public String email {get;set;}
public String domain{get;set;}
public String username{get;set;}
public String free{get;set;}
public String disposable{get;set;}
public String valid {get;set;}

}
}