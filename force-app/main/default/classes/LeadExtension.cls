public class LeadExtension 
{
    public list<lead> lList{get;set;}
   
    // to use as controller on visualforce page
    public LeadExtension()
    {
        lList= [select name,status from lead order by name];
        
    }
     
    // to use as extension on visualforce page for Standard controller
    public LeadExtension(ApexPages.StandardController s)
    {
        lList= [select name,status from lead order by name];
        
    }
    
        // to use as extension on visualforce page for Custom controller
    public LeadExtension(AccountSearchController ab)
    {
        lList= [select name,status from lead order by name];
        
    }
    
}