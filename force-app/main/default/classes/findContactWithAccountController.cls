public with sharing class findContactWithAccountController {
    @AuraEnabled
    public static list<contact> searchContacts(string accName){
        accName = '%'+ accName + '%';
        id accId = [select id, name from account where name like :accName limit 1].id;
        return [select id, lastName, phone, email from contact where accountId = :accId];
    }

}