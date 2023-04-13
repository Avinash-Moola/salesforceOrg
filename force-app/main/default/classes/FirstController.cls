public class FirstController 
{
    public string accName;
    public integer accEmployees{set;get;}
    public string conName{set;get;}
    public string conEmail{set;get;}
    public string oppName{set;get;}
    public decimal oppAmount{set;get;}
    
    public FirstController()
    {
        
    }
    
    public void saveMethod()
    {
        account a = new account(name = accName, numberOfEmployees = accEmployees );
        insert a;
        
        contact c = new contact (lastName = conName, email =conEmail, accountID = a.Id );
        opportunity o = new opportunity(name = oppName, amount = oppAmount, accountId = a.Id, StageName = 'Prospecting', closeDate = system.today()+90);
        insert c;
        insert o;
    }
    // another way to define get set methods
    public void setaccName(string a)
    {
        accName =a;
    }
    public string getaccName()
    {
        return accName;
    }
}