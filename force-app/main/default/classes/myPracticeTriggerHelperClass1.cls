public class myPracticeTriggerHelperClass1 
{
	public static void forIsInsertTrigger(list<Account> acc)
    {
        for(account a:acc) 
        {
            a.name = a.name +' created by '+ system.UserInfo.getLastName();
        }
    }
    public static void forIsUpdateTrigger(list<Account> acc)
    {
        for(account a:acc) 
        {
           a.Website = 'www.'+system.UserInfo.getLastName()+'.com';
        }
    }
}