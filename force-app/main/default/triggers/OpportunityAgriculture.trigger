trigger OpportunityAgriculture on Account (after insert, after update) 
{
    if(trigger.isAfter && (trigger.isUpdate || trigger.isInsert))
    {
        if(trigger.isInsert)
        {
            map<id,Account> newAccList = trigger.newMap;
            list<Opportunity> oppList = new list<Opportunity>();
            for (account a:trigger.new)
            {
                if(a.Industry == 'Agriculture')
                {
                    opportunity opp = new opportunity(name = a.Name + ' opp',AccountId = a.Id ,StageName = 'Prospecting', closeDate = system.today()+90);
                    oppList.add(opp);
                }
            insert oppList;
            }
        }
        
        if(trigger.isUpdate)
        {
            map<id,Account> newAccList = trigger.newMap;
            list<Opportunity> oppList = new list<Opportunity>();
            for (account a:trigger.new)
            {
                if(a.Industry == 'Agriculture' && a.Industry != trigger.oldMap.get(a.Id).Industry)
                {
                    opportunity opp = new opportunity(name = a.Name + ' opp',AccountId = a.Id ,StageName = 'Prospecting', closeDate = system.today()+90);
                    oppList.add(opp);
                }
            update oppList;
            }
        }
       
    }
}