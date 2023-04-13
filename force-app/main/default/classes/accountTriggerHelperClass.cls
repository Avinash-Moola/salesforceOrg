public class accountTriggerHelperClass 
{
	public static void accountInsertMethod(list<account> list1)
    {
            for(account a:list1)
            {
                a.Name = a.Name +' ltd.';
            }
    }
}