public class calculator
	{
	Integer a=10;
	Integer b=25;
	
		public calculator()
		{
			//this is constructure
			System.debug('Hello uday');
			System.debug('hello Class');
          
		}
		
		//add method

		public void add()
		{
		  System.debug('Addition '+ (a+b));
         }
		 
		//sub method	
		public void sub()
		{
		   System.debug('subtraction '+ (a-b));
        
		}
		
		//mul method
		public void mul()
		{
			System.debug('multiplication '+ (a*b));
		
		}
	
	}