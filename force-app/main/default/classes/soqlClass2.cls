public class soqlClass2 
{
	// Relationshipss SOQL 
	// Two types
	// 1) Child to Parent
	// 2) Parent to Child
	
    
    // 1) Child to Parent ------------ *** use dot notation --- *** use __r for field name on Child Object
    public static void myMeth1()
    {
        list<contact> contactList =[select firstName, lastName, Account.name, Account.Rating from Contact];	// standard objects
        list<Job_Application__c> jobApp=[select name,Status__c,Candidate__r.name from Job_Application__c];	// custom objects
        system.debug(contactList);
        system.debug(jobApp);
    }
    
    // 2)  Parent to Child --------- *** use sub query ----- *** use __r fros Child relationship Name on Child Object
    public static void myMeth2()
    {
        list<Account> acc=[select name,numberOfEmployees,(select firstName,Phone from Contacts) from Account];	// standard objects
        list<Position__c> pos=[select name,Type__c,(select name,Status__c from Job_Applications__r) from Position__c]; // custom objects
        system.debug(acc);
        system.debug(pos);
    }
    // Multi levell releationship
    // can access up to 5 levels
    // obj1 <- obj2 <- obj3 <- obj4 <- obj5
    // write query on obj3
    // use dot notation for its parent objects (obj2, obj1)
    // use sub query for its chaild objects (obj4, obj5)
}