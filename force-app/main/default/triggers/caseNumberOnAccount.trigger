trigger caseNumberOnAccount on Case (after insert) {
	map<id,string> caseNoMap = new map<id,string>();
    for(case c:trigger.new){
		caseNoMap.put(c.AccountId,c.CaseNumber);
	}

	list<account> accList = new list<account>();
	for(account a:[select id,Case_Number__c from account where id in :caseNoMap.keySet()]){
		a.Case_Number__c = caseNoMap.get(a.id);
		accList.add(a);
	}
	if(accList.size()>0)update accList;
}