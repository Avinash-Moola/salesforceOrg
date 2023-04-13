trigger myPracticeTriggers on Account (before insert, before update, after insert) 
{
    if(trigger.isBefore)
    {
        if(trigger.isinsert)
        {
          myPracticeTriggerHelperClass1.forIsInsertTrigger(trigger.new);
        }
        else if(trigger.isUpdate)
        {
           myPracticeTriggerHelperClass1.forIsUpdateTrigger(trigger.new);
        }
    }
    else if (trigger.isAfter)
    {
        if(trigger.isinsert)
        {
            list<opportunity> opList = new list<opportunity>();
            for (account a:trigger.new)
            {
                opportunity op = new opportunity(name = a.name +' opty', CloseDate = system.today(), StageName='Prospecting', AccountId=a.Id);
                opList.add(op);
            }
            insert opList;
        }
    }

}