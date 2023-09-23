trigger OppoStageUpdate on Account (after insert) {
    if(trigger.isAfter){
        if(trigger.isInsert){
            list<opportunity> oppList = [select id,StageName, CreatedDate from opportunity where accountId in :trigger.newMap.keySet()];
            datetime date30 = system.today()-30;
            for(opportunity o: oppList){
                if(o.StageName != 'close won' && o.CreatedDate < date30 ){
                    o.StageName = 'close lost';
                    o.CloseDate = system.today();
                }
            }
            if(oppList.size() > 0)update oppList;
        }
    }
    
}