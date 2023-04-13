public class databaseClass
{
	/* database Classes Method Result object
	 * insert, update	--	Save Result Class
	 * upsert			--	Upsert Result Class
	 * merge			--	Merge Ressult Class
	 * delete			--	Delete Result Class
	 * undelete			--	Undelete Result Class
	 * concertLead		--	Lead Convert Result Class
	 * emptyRecycleBin	--	Empty Recycle Bin Result Class
	 */
	
    public static void myMethod()
    {
        list<account> accList = new list<account>();
        for (integer i=0; i<=10; i++)
        {
            account a = new account(name ='My ressult '+i, numberOfEmployees=i); // inserting 10 account records
            acclist.add(a);
        }
        account a = new account(); //inserting one account record without name field.... to get errorr as example
        acclist.add(a);
        system.debug('accList size '+accList.size()); 	// counting total number of records....11
        Database.SaveResult[] saveList = Database.insert(accList,false);
        for (database.SaveResult s:savelist)
        {
            if (s.isSuccess())
            {
                system.debug('I was scussfull = '+s.getId());
            }
            else
            {
                system.debug('I wa unscussefull because of following errors ');
                for (database.Error dr: s.getErrors())
                {
                    system.debug(dr.getStatusCode() +' '+dr.getMessage());
                    system.debug('ffields get infected by insertion are :'+dr.getFields());
                }
            }
        }
    }
}