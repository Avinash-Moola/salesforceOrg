global class contactDescUpdateBatch implements database.Batchable<sObject>
{
	global database.QueryLocator start(database.BatchableContext bc)
    {
        return database.getQueryLocator([select id, name, accountID, Description,account.description	 from contact where accountId != null]);
    }
    global void execute(database.BatchableContext bc, list<contact> conList)
    {
        for(contact c:conList)
        {
            c.description = c.account.description;
        }
        update conList;
    }
    global void finish(database.BatchableContext bc)
    {
        
    }
}