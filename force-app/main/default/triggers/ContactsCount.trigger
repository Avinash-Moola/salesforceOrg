trigger ContactsCount on Account (before insert, before update) 
{
    list<account> accList = new list<account>();
    list<contact> conList = [select id,lastName,accountId from contact where accountId in :trigger.new];
    integer i = [select count() from contact where accountId in :trigger.new];
    for (account a: trigger.new)
    {
        a.abhisol__Contacts_Count__c = i;
        accList.add(a);
    }
    update accList;
}