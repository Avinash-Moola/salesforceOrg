public class leadConver 
{
	public static void myMethod()
    {
        lead l = [select name from lead where name like 'Lead%' limit 1];  // getting lead from table
        
        Database.LeadConvert lc = new Database.LeadConvert(); // defining new lead convert object using datbase methods
            lc.setLeadId(l.ID); // setting up lead id to lead object from above lead l
        	lc.convertedstatus = 'Closed - Converted';
        	lc.ownerid = '0055i000003AjGuAAK'; // any user ID and it should be correct 
        Database.LeadConvertResult lcr = Database.convertLead(lc);
    }
}