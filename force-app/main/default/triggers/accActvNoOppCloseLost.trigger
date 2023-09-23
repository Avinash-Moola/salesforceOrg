trigger accActvNoOppCloseLost on Account (after update){
    set<id> accIdList = new set<id>();
    for(account a:trigger.new){
        if(a.active__c =='No' && trigger.oldMap.get(a.id).active__c !='No'){
            accIdList.add(a.id);
        }
    }
    list<Opportunity> oppList = new list<Opportunity>();
    for(Opportunity o:[select id,stageName from Opportunity where accountId in :accIdList]){
        if(o.stageName != 'Closed Won' && o.stageName !='Closed Last'){
            o.stageName = 'Closed Last';
            oppList.add(o);
        }
    }
    if(oppList.size()>0)update oppList;

}