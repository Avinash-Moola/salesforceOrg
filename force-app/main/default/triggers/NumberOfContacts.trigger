trigger NumberOfContacts on Account (after insert) 
{
    
    contact[] conList = new list<contact>() ;
    for (account a:trigger.new)
    {
        for (integer i =1;i<=a.NumberOfContacts__c;i++)
        {
            contact c = new contact(lastName = a.Name + i, AccountId = a.Id);
            conList.add(c);
            system.debug(c);
        }
        
    }
    insert conList;
}