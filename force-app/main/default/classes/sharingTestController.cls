public   class sharingTestController 
{
    public list<abhisol__Job_Application__c> accList{get;set;}
    public list<object> stList{get;set;}
    
    public sharingTestController()
    {
        //accList =[select name,id,status__C from abhisol__Job_Application__c];
        jobAppclass ja = new jobAppclass();
        accList = ja.jobAppList();
        stList = accList;
        system.debug(stList);
    }
    
    public   class jobAppclass
    {
        
        public  list<abhisol__Job_Application__c> jobAppList()
        {
            return[select id,name,status__C from abhisol__Job_Application__c];
        }
    }
}