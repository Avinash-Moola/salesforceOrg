trigger noOfTimesOpened on Case (before insert, before update) {
    for(Case c:trigger.new)
    {
        if(c.Status != 'Closed')
        {
            c.abhisol__No_Of_Times_Opened__c    = c.abhisol__No_Of_Times_Opened__c  +1;
        }
    }
}