trigger contactAddressUpdate on Account (after update) 
/*{
    map<ID,Account> nMap = trigger.newMap;
    list<contact> conList = [select name, AccountID, Phone, OwnerId from contact where AccountID in :nMap.keySet()];
    for (Contact c:conList)
    {
        Account a = nMap.get(c.AccountId);
        c.Phone = a.Phone;
        c.OwnerId = a.OwnerId;
    }
    update conList;
}

*/
/*
{
    list<contact> conList = [select id,MailingCity,accountId from contact where accountId in :trigger.newMap.keySet()];
    for(account a:trigger.new)
    {
        for(contact c:conList)
        {
            if(c.accountID == a.id)
            {
                c.MailingCity=a.BillingCity;
            }
        }
    }
    update conList;
}
*/
{
    list<contact> cList = new list<contact>();
    map<id,account> accMap = new map<id,account>([select name,BillingCity, (select id,MailingCity from contacts) from Account where Id in :trigger.newMap.keySet()]);
    for(account a:trigger.new)
    {
       if(!accMap.get(a.Id).contacts.isEmpty())
       {
          list<contact> conList = accMap.get(a.Id).contacts;
        for(contact c:conList)
        {
            c.MailingCity=a.BillingCity;
            cList.add(c);
        } 
       }
        
    }
    update cList;
}