public class utlityclass{

public static boolean isDone = false;

public static boolean state(){

if(!isDone){
isDone = true;
}
else 
if(isDone){
isDone = false;

}

return isDone;
} 

}