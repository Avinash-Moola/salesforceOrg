trigger AccountBeforeDelete on Account (before delete)
{
    for (Account a:trigger.old)
    if (a.AccountNumber==null)
    {
        a.adderror('Hey..!! Account without Account Number cannot be deleted as per the trigger rules');
    }
}