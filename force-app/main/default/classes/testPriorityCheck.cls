@isTest
public class testPriorityCheck 
{
	@isTest
    static void testNormal()
    {
        string pri = priorityCheck.myMethod(-1);
        system.assertEquals('Normal', pri);
    }
    
    @isTest
    static void testWorm()
    {
        string pri = priorityCheck.myMethod(10);
        system.assertEquals('Normal', pri);
    }
    
    @isTest
    static void testHot()
    {
        string pri = priorityCheck.myMethod(120);
    }
}