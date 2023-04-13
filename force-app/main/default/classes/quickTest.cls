public class quickTest 
{
	public static void quickMethod()
    {
        account a = new account (name = 'xeon');
            insert a;
    }
    
    public static void quickMethod1()
    {
        list<account> accList =[select name, phone,AccountNumber from account where name like 'xeon%'];
        for (account a:accList)
        {
            a.AccountNumber = a.Name + ' 123456';
        }
        update accList;
    }
    
    public static void quickMethod2()
    {
        list<account> accList = [select name from account where name  like 'xeon%'];
        delete accList;
    }
    
    public static void quickMethod3()
        {
            list <account> accList = [select name from account where name like 'xeon%' and isDeleted = true all rows];
            undelete acclist;
        }
    
    public static void quickMethod4()
    {
        list<account> accList = new list<Account>();
        for (integer i=1;i<=5;i++)
        {
            account a= new account(name = 'xyz '+i);
            accList.add(a);
        }
        database.SaveResult[] sr= database.insert(accList, false);
        for (database.SaveResult s : sr)
        {
            if(s.isSuccess())
            {
                system.debug('Records :'+s.getId()+' scusses');
            }
            else
            {
                for (database.Error dr: s.getErrors())
                {
                    system.debug(dr.getFields()+'  '+dr.getMessage()+'  '+dr.getStatusCode()+'  '+dr.message);
                }
            }
        }
    }
    
    public static void quickMethod5()
    {
		try
        {
            integer i =1;
            i=i+1;
            system.debug(i);
            
           // account a = new account();
           // insert a;
            
            list<integer> l1= new list<integer>{10,20,30};
            integer j=l1[2];
            system.debug(j);
            
            list<account> accList =[select name from account];
            for (account a:accList)
            {
                a.NumberOfEmployees = 10;
            }
            update accList;
        }
        catch(nullpointerexception npe)
        {
            system.debug('exception type :'+npe.getTypeName());
            system.debug('exception message :'+npe.getMessage());
        }
        
        catch(DmlException de)
        {
            system.debug('exception type :'+de.getTypeName());
            system.debug('exception message :'+de.getMessage());
         }
        catch(listexception le)
        {
            system.debug('exception type :'+le.getMessage());
        }
    }
    
    public static void quickMethod6(integer i)
    {
        try
        {
           if(i<0)
           {
               throw new myCustomException();
               
           }
            else
            {
                system.debug(i);
            }
        }
        catch(myCustomException me)
        {
            system.debug('My custom exception');
        }
    }
    
    public static void calloutTestMethod()
    {
       Http http = new Http();
        HttpRequest req = new HttpRequest();
        
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        req.setMethod('GET');
        
        HttpResponse res = http.send(req);
        system.debug(res.getStatusCode());
        
        
    }
    
    public static void quickMthod7()
    {
        list<account> acc = [select name,id,(select id,amount from Opportunities) from account where createdDate = today];
        
        for(account a:acc)
        {
            decimal totalAmount =0;
            list<opportunity> opp = a.Opportunities;
            for(opportunity o:opp)
            {
                totalAmount = totalAmount + o.amount;
            }
            a.abhisol__Pipeline_Amount__c=totalAmount;
        }
        update acc;
    }
}