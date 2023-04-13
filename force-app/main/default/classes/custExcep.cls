public class custExcep 
{
	// custom exceptionss
	
    public static void myMethod(integer i)
    {
        try
        {
          if (i<0)
        	{
            throw new myException();
        	}
        else
        	{
            system.debug(i);
        	}
        }
		catch (myException e)
        {
            system.debug('my custom exception meage');
           
        }
    }
}