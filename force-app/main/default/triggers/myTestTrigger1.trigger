trigger myTestTrigger1 on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) 
{
    if(trigger.isbefore)
    {
       if(trigger.isInsert)
        {
            accountTriggerHelperClass.accountInsertMethod(trigger.new);  //using helper class
        }
        else if(trigger.isUpdate)
        {
            map<id,account> accListOld = trigger.oldMap;
            map<id,account> accListNew = trigger.newMap;
            
            list<contact> conList = [select id,name,accountID from contact where accountId in :accListNew.keyset()];
            for(contact c:conList)
            {
               account a=accListNew.get(c.AccountId);
                c.MailingCity = a.BillingCity;
            }
            update conList;
            system.debug('Before Update trigger');
        }
        
        else if (trigger.isdelete)
        {
            for(account a:trigger.old)
            {
                if(a.Rating !=null)
                {
                     a.rating.addError('Record with Ratings can not be deleted');
                }
               
            }
        }
        
    }
    else if (trigger.isAfter)
    {
        system.debug('After Trigger');
        
        if(trigger.isInsert)
        {
            system.debug('After insert trigger');
        }
        else if(trigger.isUpdate)
        {
            system.debug('After Update trigger');
        }
    }
   
}