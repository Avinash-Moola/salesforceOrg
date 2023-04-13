public class priorityCheck 
{
	public static string myMethod(integer i)
    {
        string priority;
        if(i<=0 )
        {
            priority ='Normal';
        }
        else if(i>0 && i<100)
        {
            priority = 'Worm';
        }
        else
        {
            priority = 'Hot';
        }
        return priority;
    }
}