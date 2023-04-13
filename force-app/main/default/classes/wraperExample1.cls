public class wraperExample1 
{
    public static wrapperData myMethod()
    {
        return new wrapperData();
    }
    
    public class wrapperData{
        list<account> accList;
        list<contact> conList;
        
        public  wrapperData()
        {
            accList = [select name from account];
            conList = [select lastName from contact];
        }
    }
}