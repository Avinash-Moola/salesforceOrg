public class OpportunityDelete 
{
	@InvocableMethod
    public static void DeleteOpp(list<id> i)
    {
        opportunity opp = [select id,name from opportunity where id = :i limit 1];
        delete opp;
    }
}