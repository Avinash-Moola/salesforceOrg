trigger ClientContact on Account (after insert) {
    list<contact> conList = new list<contact>();
    map<id,contact> contactMap = new map<id,contact>();
    list<account> accList = new list<account>();
    for(Account a:trigger.new){
        contact c = new contact();
        c.lastName = a.Name;
        c.Phone = a.Phone;
        c.AccountId = a.Id;
        conList.add(c);
        contactMap.put(c.AccountId,c);
    }
    if(conList.size()>0){
        insert conList;
        for(account a:[select id,abhisol__Client_Contact__c from account where id in :trigger.newMap.keySet()]){
            a.abhisol__Client_Contact__c = contactMap.get(a.id).id;
            accList.add(a);
        }
        if(accList.size()>0)update accList;
    }
    
}