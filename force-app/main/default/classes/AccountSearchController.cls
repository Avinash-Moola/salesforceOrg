public with sharing class AccountSearchController
{
    public string accName{get;set;}
    public list<account> accList{get;set;}
    
    public AccountSearchController()
    {
        
    }
    
    public void searchMethod()
    {
        accName ='%'+accName+'%';
        accList = [select name, phone from Account where Name like :accName order by name];
      
    }
}