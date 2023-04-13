public class soqlClass 
{
	public static void myMethod(string str)
    {
        list<contact> conlist =  [select Name from Contact where firstName = :str];
            
           for (contact c:conlist)
           {
               system.debug(c.name);
           }
    }
    
    public static void myMethod1()
    {
        Account acc=[select name from Account where name ='Avi'];
        system.debug(acc);
    }
    public static void myMethod2()
    {
        integer i =[select count() from opportunity];
        system.debug(i);
    }
    public static void myMethod3()
    { 
        aggregateResult agr=[select count(id) from opportunity];
        system.debug(agr);
    }
    public static void myMethod4()
    { 
        aggregateResult agr=[select min(Amount)min,max(amount)max,sum(amount) total from opportunity];
        system.debug(agr);
    }
}