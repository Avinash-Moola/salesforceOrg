trigger checkContactBeforeDelete on Account (before delete) 
{
    map<id,account> accMap =new map<id,account>( [select id,(select id from contacts) from account where id in :trigger.oldMap.keySet() ]);
    for(account a:trigger.old)
    {
        list<contact> conList = accMap.get(a.Id).contacts;
        if(a.contacts.size()!=0)
        {
            a.adderror('Account have '+accMap.get(a.Id).contacts.size() +' related contacts');
        }
    }
    
    //another way
    /*
     map<id,account> accMap =new map<id,account>( [select id,(select id from contacts) from account where id in :trigger.oldMap.keySet() ]);
    for(account a:trigger.old)
    {
        list<contact> conList = accMap.get(a.Id).contacts;
        if(accMap.get(a.Id).contacts.size()!=0)
        {
            a.adderror('Account have '+accMap.get(a.Id).contacts.size() +'related contacts');
        }
    }
    */
}