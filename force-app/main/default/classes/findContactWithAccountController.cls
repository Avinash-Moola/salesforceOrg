public with sharing class findContactWithAccountController {
    @AuraEnabled
    public static list<contact> searchContacts(string accName){
        accName = '%'+ accName + '%';
        id accId = [select id, name from account where name like :accName limit 1].id;
        return [select id, lastName, phone, email from contact where accountId = :accId];
    }
    
    public class AccountWithContactsWrapper {
             Account acc;
             List<Contact> contacts;
            
            public AccountWithContactsWrapper(){
                acc = [SELECT Id, Name, (SELECT Id, FirstName, LastName, Email FROM Contacts) FROM Account limit 1];
                contacts = acc.Contacts;
            }
        }

}