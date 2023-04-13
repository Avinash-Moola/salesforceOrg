public class soqlclass1 
{
	// general Soql query
    public static void myMeth()
    {
        list<Account> acc=[select name,NumberOfEmployees from Account];
        system.debug(acc);
    }
    //**************************************
    // using Where clause
    public static void myMeth1()
    {
        list<account> acc=[select name,NumberOfEmployees from Account where name ='Avi'];
        system.debug(acc);
    }
    //**************************************
    // using a variable 
    public static void myMeth2(string s)
    {
        list <account> acc=[select name from Account where name = :s];
        system.debug(acc);
    }
    //**************************************
    // return types in SOQL asfollows
    // list<sObject>
    // sObject
    // integer
    // aggregateResult
   
    // list<sObject> type
    public static void myMeth3()
    {
        list<Account> acc=[select name from Account];
        system.debug(acc);
    }
    
    // sObject type ----------- it works if query results one record
    public static void myMeth4()
    {
        account a=[select name from Account where name ='Avi' and Rating = 'hot'];  // it returns only one record
        system.debug(a);
    }
    
    // aggregateResult type
    public static void myMeth5()
    {
        aggregateResult agg = [select count(amount) from Opportunity];
        system.debug(agg);
    }
    //**************************************
    // aggregrate funcations
    // following funcations are available
    // sum()
    // Avg()
    // Min()
    // Max()
    // Count() --- Count(ID) --- Count(sObject)
    // Count_Distanct
    
    // sum() type
    public static void myMeth6()
    {
        aggregateResult agg=[select sum(amount) from Opportunity];
        system.debug(agg);
    }
    
    // Average()
    public static void myMeth7()
    {
        aggregateResult agg = [select avg(Amount) from Opportunity];
        system.debug(agg);
    }
    
    // Min() & Max()
    public static void myMeth8()
    {
        aggregateResult agg = [select min(amount),max(amount) from Opportunity];
        system.debug(agg);
    }
    
    // Count()
    public static void myMeth9()
    {
        integer i = [select count() from Opportunity];
        system.debug(i);
    }
    
    // Count(ID)
    public static void myMeth10()
    {
        aggregateResult agg = [select count(ID) from Opportunity];
        system.debug(agg);
    }
    
    // Count(Amount)
    // Count(ID)
    public static void myMeth11()
    {
        aggregateResult agg = [select count(Amount) from Opportunity];
        system.debug(agg);
    }
    //**************************************
    // Keywords
    // IN, NOT, LIKE, GROUP BY, ORDER BY, ALL ROWS, LIMIT, FOR UPDATE
    //
    // IN
    public static void myMeth12()
    {
        list<string> l1 = new list<string> {'Avi','Dickenson plc','GenePoint','Pyramid Construction Inc.'};
        list <Account> acc=[select name from Account where name IN :l1 ];
        system.debug(acc);
    }
    
     // NOT
    public static void myMeth13()
    {
        list<string> l1 = new list<string> {'Avi','Dickenson plc','GenePoint','Pyramid Construction Inc.'};
        list <Account> acc=[select name from Account where name NOT IN :l1 ];
        system.debug(acc);
    }
    
    // LIKE
    public static void myMeth14()
    {
        list<account> acc1= [select Name from Account where name LIKE 'Av%'];
        list<account> acc2= [select Name from Account where name LIKE '%oil%'];
        list<account> acc3= [select Name from Account where name LIKE '_Force'];
        
        system.debug(acc1);
        system.debug(acc2);
        system.debug(acc3);
    }
    
    // Group By ---- return type should be aggregateResult
    public static void myMeth15()
    {
       list<aggregateResult> acc=[select Rating from Account group by Rating ];
        system.debug(acc);
    }
    
    // Order By
    public static void myMeth16()
    {
        list <Opportunity> acc1=[select name, Amount from Opportunity order by Amount];		// same result
        list <Opportunity> acc2=[select name, Amount from Opportunity order by Amount Asc];	// same result
        list <Opportunity> acc3=[select name, Amount from Opportunity order by Amount Desc];
        list <Opportunity> acc4=[select name, Amount from Opportunity order by Amount NULLS FIRST];
        list <Opportunity> acc5=[select name, Amount from Opportunity order by Amount NULLS LAST];
        system.debug(acc1);
        system.debug(acc2);
        system.debug(acc3);
        system.debug(acc4);
        system.debug(acc5);
    }
    
    // All Rows
    public static void myMeth17()
    {
        list <Account> acc1=[select name from Account ALL ROWS];	// results all records including recycle bin
        list <Account> acc2=[select name from Account where isDeleted = true ALL ROWS];  // results records from recycle bin
        system.debug(acc1);
        system.debug(acc2);
    }
    
    // LIMIT
    public static void myMeth18()
    {
        list <account> acc1=[select name from Account LIMIt 10];
        list <account> acc2=[select name from Account LIMIt 1];
        Account acc3=[select name from Account LIMIT 1];
        system.debug(acc1);
        system.debug(acc2);
        system.debug(acc3);
    }
    
    // FOR UPDATE
    public static void myMeth19()
    {
         list <account> acc=[select name from Account FOR UPDATE];
        system.debug(acc);
    }
    //**************************************
    // Date Literals
    // yesterday, TODAY, TOMORROW, last_month, last_week  
    public static void myMeth20()
    {
        list <account> acc1,acc2,acc3;
        acc1=[select name from Account where createdDate = YEsTERDAY];
        acc2=[select name from Account where createdDate = TODAY];
        acc3=[select name from Account where createdDate = last_month];
        system.debug(acc1);
        system.debug(acc2);
        system.debug(acc3);
    }
}