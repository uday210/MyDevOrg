public class mypage1con {

public list<Account> Accs {get;set;}

    public mypage1con (){
    
    Accs = [select id,Name from Account];
    
    }
    
    public pagereference printData(){
    
    pagereference  pg = page.my_page1pdf;
    return pg;
    }
}