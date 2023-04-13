public with sharing class LWCClass1 
{
	 @AuraEnabled(cacheable=true)
   public static list<contact> myMethod()
   {
        list<contact> acc = [select id, LastName, phone from contact ];
    return acc;
   }
}