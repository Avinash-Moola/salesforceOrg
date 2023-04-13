trigger cCountOnAccount on Contact (after insert, after update) 
{
	/*
	 * Not related to this trigger---	i is onl to check trigger.isExecuting using helper class
	 *  triggerHandlerUsingIsExecuting handler = new triggerHandlerUsingIsExecuting();
    handler.isExecutingMethod(trigger.isExecuting);
	*/
    set<id> accIds = new set<id>();
    for(contact c:trigger.new)
    {
        accIds.add(c.accountId);
    }
    list<account> accList = [select name,cCount__c from account where id in :accIds];
    map<id,account> accMap = new map<id,account>([select name,cCount__c, (select id from contacts) from account where id in :accIds]);
    for(account a:accList)
    {
        a.abhisol__cCount__c=accMap.get(a.Id).contacts.size();
    }
    update accList;
}