trigger opportunityStageUpdate on Opportunity (before update) 
{
	
    for(opportunity o:trigger.new)
    {
        if(o.amount >= 10000)
        {
            o.StageName = 'Closed Won';
            
        }
    }
   
}