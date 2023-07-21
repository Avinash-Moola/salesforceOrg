public class UpdateContactPhoneWithFlow {

    @InvocableMethod(label='Update Contact Phone')
    public static void updateContactPhone(List<Contact> contacts) {
        // Create a set of Account Ids to retrieve their phone fields
        Set<Id> accountIds = new Set<Id>();
        for (Contact c : contacts) {
            accountIds.add(c.AccountId);
        }

        // Retrieve the Accounts with their phone fields
        List<Account> accounts = [SELECT Id, Phone FROM Account WHERE Id IN :accountIds];

        // Create a map of Account Id to Account Phone
        Map<Id, String> accountPhones = new Map<Id, String>();
        for (Account a : accounts) {
            accountPhones.put(a.Id, a.Phone);
        }

        // Update the Contact phone fields with the corresponding Account phone fields
        List<Contact> contactsToUpdate = new List<Contact>();
        for (Contact c : contacts) {
            if (accountPhones.containsKey(c.AccountId)) {
                c.Phone = accountPhones.get(c.AccountId);
                contactsToUpdate.add(c);
            }
        }
        update contactsToUpdate;
    }
}