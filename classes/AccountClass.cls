public class AccountClass
{
	public AccountClass()
	{
	
	}
	
	public id AccInsert(String Name,String AccNumber,String Site)
	{
	
	Account a = new Account();
	a.Name = Name; 
    a.AccountNumber = AccNumber;
    a.Site = Site;    
        
	insert a;
        
    return a.id;
	
	}
    
    public void AccDelete(id accid)
    {
        //write a sowl query
        Account a = [select name from Account where id=:accid];
        delete a;
    }


}