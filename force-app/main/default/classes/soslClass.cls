public class soslClass 
{
	public static void myMethod()
    {
       List< list<sObject>> listOflist = [find 'Avi'  returning Account(name), Contact];
       list<Account> accList = listOflist[0];
       list <Contact> conList = listOfList[1];
        for (Account acc:accList)
        {
            system.debug(acc.Name);
        }
        for (Contact con : conList)
        {
            system.debug(conList);
        }
    }
}