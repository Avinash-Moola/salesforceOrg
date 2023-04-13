public class calculatorClass 
{
    public static integer num{set;get;}
    public static integer oNum{set;get;}
    public static integer temp=0;
    public calculatorClass()
    {
        
    }
    
    public static void addition()
    {
		oNum=num+temp;
        temp =num;
        
    }
}