public with sharing class training1Class {
    
   @AuraEnabled(cacheable=true)
   public static list<Account> getAccounts(){
    return [select id, name from account LIMIT 10];
   }
}