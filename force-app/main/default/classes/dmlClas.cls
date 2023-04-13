public class dmlClas
{
        // DML Statements
        // insert
        // update
        // upsert
        // delete
        // undelete
        // merge
        
        // insert
    public static void insertMe1()
    {
        account a = new account (name = 'Testing',phone='987564');
        insert a;

    }
    
    // insert more records
    public static void insertMe2()
    {
        list <account> accList = new list<account>();
        for (integer i =1;i<=10;i++)
        {
            account a = new account (name ='Testing '+i);
            accList.Add(a);
        }
        insert accList;
    }
    
    // update
    public static void updateMe()
    {
        list<Account> accList =[select name, site from Account where name like 'Test%'];
        for (Account a:accList)
        {
            a.AccountNumber = 'Acc No: 125666';
        }
        update accList;
    }
    
    // upsert
    public static void upsertMe()
    {
        list<account> accList =[select Name, Phone from Account where name like 'Test%'];
        for (Account a:accList)
        {
            a.Phone = '654789';
        }
        for (integer i =11;i<=15;i++)
        {
            account acc = new account(name ='Testing '+i, phone ='63215');
           accList.add(acc);
        }
        upsert acclist;
    }
    
    // delete
    public static void deleteMe()
    {
        list <Account> accList =[select Name from Account where name like 'Test%'];
        
        system.debug(accList);
        delete accList;
    }
    
    // undelete
    public static void undeleteMe()
    {
        list<account> accList = [select name from Account where name like 'Test%' and isDeleted =true All Rows];
        system.debug(accList);
        undelete accList;
    }
    
    // merge
    // works with only Account Leads, Contacts
    // you can directly merge two records or you can add maximum 3 records to list and merge
    public static void mergeMe()
    {
        list <account > accList = [select name from Account where name like 'Merg%' order by name Asc limit 3 ];
        account a = accList[0]; //Merge 1
        account b = accList[1]; //Merge 2
        account c = accList[2]; //Merge 3
        merge a b;
    }
}