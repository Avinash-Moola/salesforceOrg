global class pipelineAmountUpdateBatchClass  implements database.Batchable<sObject>, schedulable, database.stateful
{
	global static database.QueryLocator start(database.BatchableContext bc)
    {
        return database.getQueryLocator('select name,id,(select id,amount from Opportunities) from account where createdDate = today');
    }
    global static void execute(database.BatchableContext bc,list<account> accList)
    {
		for(account a:accList)
        {
            decimal totalAmount =0;
            list<opportunity> opp = a.Opportunities;
            for(opportunity o:opp)
            {
                totalAmount = totalAmount + o.amount;
            }
            a.abhisol__Pipeline_Amount__c=totalAmount;
        }
        update accList;        
    }
    global static void finish(database.BatchableContext bc)
    {
        
    }
    global static void execute(system.SchedulableContext sc)
    {
        pipelineAmountUpdateBatchClass batchable = new pipelineAmountUpdateBatchClass();
        database.executeBatch(batchable, 200);
    }
}