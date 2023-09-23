trigger oppStageChangeCreateTask on opportunity (after update){
	set<id> oppList = new set<id>();
	for(opportunity o:trigger.new){
		if(o.stageName != trigger.oldMap.get(o.id).stageName){
			oppList.add(o.id);
		}
	}
	list<task> taskList = new list<task>();
	for(opportunity o:[select id from opportunity where id in :oppList]){
		task tsk = new task();
		tsk.subject = 'Call';
		tsk.priority = 'Low';
        tsk.Status = 'Not Started';
		tsk.whatId = o.id;
        tsk.ActivityDate = system.today()+30;
		tsk.ownerId = userInfo.getUserId();
        taskList.add(tsk);
	}
	if(taskList.size()>0)insert taskList;
}