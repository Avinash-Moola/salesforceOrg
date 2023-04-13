trigger ownerChange on Account (before update) 
{
    if(trigger.isupdate && trigger.isbefore)
    {
        list <contact> conList = new list<contact>();
        map<id,account> oldAccList = trigger.oldMap;
        map<id,account> newAccList = trigger.newMap;
        list <Account> changedAccList = new list<account>();
        for(account a:trigger.new)
        {
            if(a.OwnerId != oldAccList.get(a.Id).OwnerId)
            {
                changedAccList.add(a);
            }
        }
        for (contact c:[select id,accountId, ownerId from contact where AccountId in :changedAccList])
        {
            c.OwnerId = newAccList.get(c.AccountId).OwnerId;
        }
       update conList;
    }
}