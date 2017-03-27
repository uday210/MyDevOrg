public class MyHandleTwo implements myFirstInterface{


    public String myMethodOne(){
    
    
    return 'hello from MyHandleTwo ';
    }
    
    public Boolean myMethodTwo(){
    
    return false;
    }
    
    
    public pageReference mypageRef(){
    
        pageReference pageref = new pageReference('https://www.facebook.com');
    
    
    return pageref;
    }
    
    
    public String separateMethod(){
    
    return 'this is a separate ';
    }
    
}