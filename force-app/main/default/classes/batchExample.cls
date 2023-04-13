global class batchExample implements Database.Batchable<sObject>, schedulable
{
	global  Database.QueryLocator start(database.BatchableContext bc)
        {
            return database.getQueryLocator([select name, website from account where name  like 'Testing%']);
        }
    global  void execute(database.BatchableContext bc, list<account> acc)
    {
        list<account> accList = new list<account>();
        for (account a:acc)
        {
            a.website = 'www.google.com';
            
            accList.add(a);
        }
        update accList;
    }
    global  void finish(database.BatchableContext bc)
    {
        // sending email using code
        messaging.SingleEmailMessage mail = new messaging.SingleEmailMessage();
            list<string> toAddress = new list<string>{'avinash38m@gmail.com','sohimaguna@gmail.com'};
            mail.setToAddresses(toAddress);
            mail.setSubject('Batch job Completed');
            mail.setPlainTextBody('Hey, batch job you scheduled is completed');
        messaging.sendEmail(new messaging.SingleEmailMessage[]{mail});
    }
    
    global void execute(SchedulableContext sc)
    {
        batchExample abc = new batchExample();
        database.executeBatch(abc);
    // to schedule,
    // goto Setup > Apex Classes > Click Schedule Apex button
    // select required batch apex class (* batch apex classes with implements schedulable interface wll be shown in list)
    }
    
}