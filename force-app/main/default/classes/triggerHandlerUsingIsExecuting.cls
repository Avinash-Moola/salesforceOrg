public class triggerHandlerUsingIsExecuting 
{
	public boolean  isExecutingStatus = false;
    public  void isExecutingMethod(boolean isExecutingStatusFromTrigger)
    {
		if(isExecutingStatusFromTrigger)        
        {
            system.debug('method executed from trigger and isExecuting status is: '+isExecutingStatusFromTrigger);
        }
        else
        {
            system.debug('method not executed from trigger and isExecuting status is: '+isExecutingStatusFromTrigger);
        }
        
    }
}