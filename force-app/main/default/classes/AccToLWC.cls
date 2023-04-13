public with sharing class AccToLWC {
   @AuraEnabled(cacheable=true)
   public static list<account> myMethod()
   {
        list<account> acc = [select id, name, phone from account];
    return acc;
   }
}