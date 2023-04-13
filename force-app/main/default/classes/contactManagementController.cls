public class contactManagementController 
{
    public static list<contact> conList{get;set;}
    public static string lName{get;set;}
    public static string phon{get;set;}
    public static boolean isCheck{get;set;}
    public static list<id> conIdList{get;set;}
     public Contact selectedContact { get; set; }

    
    public static void contactManagementController()
    {
        conList = [select ID, lastName, phone from contact order by createdDate desc];
    }
    
    public void createContact()
    {
        contact con = new contact(lastName = lName, phone = phon);
        insert con;
        contactManagementController();
        system.debug(con);
    }
    
	public void deleteContact()
    {
        selectedContact = [SELECT Id FROM Contact WHERE Id = :ApexPages.currentPage().getParameters().get('contactId')];
        delete selectedContact;
        selectedContact = null;
        system.debug('gkjf');
    }
    
    //----------Calculator
    public decimal number1{get;set;}
    public decimal number2{get;set;}
    public decimal result{get;set;}
    public string operator{get;set;}
    
    public void calculate()
    {
        if(operator =='add')
        {
            result = number1 + number2;
        }
        else if(operator =='sub')
        {
            result = number1 - number2;
        }
        else if(operator =='multi')
        {
            result = number1 * number2;
        }
        else if(operator =='divide')
        {
            if(number2 == 0)
            {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Cannot divide by zero'));
            }
            else{
                result = number1 / number2;
            }
            
        }
    }
    
    
    
}