public class exceptionClass 
{
	// Dml exception
	public static void myMethod1()
    {
        try
        {
            account a1 = new account(name ='My Testing Dml exception');
        account a2 = new account();
        insert a1;
        insert a2;
        } 
        catch (exception e)
        {
            system.debug('Following exception occured '+e.getMessage());
            system.debug('And its cause '+e.getCause());
        }
    }
}