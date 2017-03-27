public class MyHandleOne implements myFirstInterface{


    public String myMethodOne(){
    
    
    return 'hello from MyHandleOne ';
    }
    
    public Boolean myMethodTwo(){
    
    return true;
    }
    
    
    public pageReference mypageRef(){
    
        pageReference pageref = new pageReference('https://www.google.com');
    
    
    return pageref;
    }
    
}