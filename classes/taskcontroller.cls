public class taskcontroller {
@AuraEnabled
    public Static Task taskcreate(String subject,String priority,String type,String description)
    {
        Task t = new Task();
        t.Subject = subject;
        t.Description = description;
        t.Priority = priority;
        t.Type = type;
        t.OwnerId = UserInfo.getUserId();
        t.ActivityDate = Date.today() + 2;
        
        insert t;
        System.debug('=====> '+t);
        return t;
        
    }
}