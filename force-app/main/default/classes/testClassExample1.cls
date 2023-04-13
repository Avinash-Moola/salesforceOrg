@isTest
public class testClassExample1 
{
	
    @testSetup
    static void testData()
    {
        account a=new account(name='testAccount123');
       
        insert a;
        
    }
    @isTest
    static void accountTest()
    {
        integer acc=[select count() from account where name ='testAccount123' ];
        system.assertEquals(1, acc);
    }
    @isTest
    static void accountTest1()
    {
        integer acc=[select count() from account where name ='testAccount123' ];
        system.assertEquals(1, acc);
    }
    
    
}