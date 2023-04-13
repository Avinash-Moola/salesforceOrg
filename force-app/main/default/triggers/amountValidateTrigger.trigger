trigger amountValidateTrigger on Opportunity (before update) 
{
    for (opportunity oldOpp : trigger.old)
    {
        for (Opportunity newOpp: trigger.New)
        {
            if (oldOpp.Id == newOpp.Id && oldOpp.Amount != newOpp.Amount )
                newOpp.Amount.addError('Amount not same as old Amount');
    
    }
}
}