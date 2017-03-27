public class restcontroller {
    @AuraEnabled
    public Static String getRestdata(String email){
        
        return emailvalibator.validate_email(email);
    }

}