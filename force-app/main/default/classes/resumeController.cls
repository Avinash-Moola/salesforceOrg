public class resumeController 
{
    public static string Designation {get;set;}
    public static list<abhisol__Experience__mdt> expList{get;set;}
    public static list<abhisol__Education__mdt> eduList{get;set;}
    public static List<abhisol__certification__mdt> certList{get;set;}
    public static string name;
    
    public resumeController()
    {
    //retrive Experience records
      expList = [select id, Label, abhisol__City__c, abhisol__Current_Employer__c, abhisol__Description__c, abhisol__Designation__c, abhisol__End_Date__c, abhisol__Start_Date__c from abhisol__Experience__mdt ORDER BY abhisol__Start_Date__c DESC];
      eduList = [SELECT id,label,abhisol__Degree__c,abhisol__End_Date__c,abhisol__Field_of_study__c,abhisol__Start_Date__c FROM abhisol__Education__mdt ORDER BY abhisol__Start_Date__c DESC];
      certList = [select id,label from abhisol__certification__mdt];
		
    } 
    
}
