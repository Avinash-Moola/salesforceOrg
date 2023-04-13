public with sharing class AccountController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [SELECT Id, Name, Phone, Website FROM Account];
    }
    
    @AuraEnabled(cacheable=true)
    public static List<Account> searchAccounts(String searchTerm) {
        return [SELECT Id, Name, Phone, Website FROM Account WHERE Name LIKE :('%' + searchTerm + '%')];
    }
}