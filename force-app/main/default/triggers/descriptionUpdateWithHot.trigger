trigger descriptionUpdateWithHot on Opportunity (before insert, before update, after insert, after update) {
/*    for(opportunity o:trigger.new){
        if(o.amount != null && o.amount > 10000){
            o.Description = 'Hot Opportunity';
        }
    } */
    
    if(trigger.isAfter){
        if(trigger.isUpdate){
            list<task> taskToCreate = new list<task>();
            for(opportunity o:trigger.new){
                if(o.StageName != trigger.oldMap.get(o.Id).stageName){
                    task t = new task();
                    t.Subject = 'Call';
                    t.Priority = 'Hot';
                    t.OwnerId = userInfo.getUserId();
                    t.WhatId = o.Id;
                    taskToCreate.add(t);
                }
            }
        }
    }
}