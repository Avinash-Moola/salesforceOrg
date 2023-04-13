public class LeadAndAccount
{
	public static void insertLeadAndAccount(string AccName,string LeadLastName,string Company)
    {    
        Account A=new Account(Name=AccName);
        insert A;
    	Lead L=new Lead(lastName=LeadLastName,Company=Company);
     	insert L;
    }
    
}