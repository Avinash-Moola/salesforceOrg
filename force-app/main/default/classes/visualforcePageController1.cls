public class visualforcePageController1 
{
    public visualforcePageController1()
    {
        numString='';   
    }
    //	Type-1---------------------------------
    public Integer number1 { get; set; }
    public Integer number2 { get; set; }
    public Integer result { get; set; }
    public list<account> acc{get;set;}

    public void calculate() {
        result = number1 + number2;
    }
    public list<account> getCaliforniaAccounts() 
    {
      acc= [SELECT Name, BillingCity, BillingPostalCode FROM Account ];
        return acc;
    }
    
    public void addition()
    {
        result=number1 + number1;
    }
    public void subtraction()
    {
        result=number1 - number2;
    }
    
    
    //	Type-2---------------------------------
    public integer one{get;set;}
    public integer two{get;set;}
    public integer three{get;set;}
    public integer four{get;set;}
    public integer five{get;set;}
    public integer six{get;set;}
    public integer seven{get;set;}
    public integer eight{get;set;}
    public integer nine{get;set;}
    public integer zero{get;set;}
    public string numString{get;set;}
    public list<integer> numList;
	
    // operation symbols
    public void plus()
    {
       // numList.add(1);
        numString=numString+'+';
    }
    public void minus()
    {
       // numList.add(1);
        numString=numString+'-';
    }
    public void multi()
    {
       // numList.add(1);
        numString=numString+'-';
    }
    public void devide()
    {
       // numList.add(1);
        numString=numString+'-';
    }
    
    // numbers
    public void one()
    {
       // numList.add(1);
        numString=numString+'1';
    }
    public void two()
    {
       // numList.add(1);
        numString=numString+'2';
    }
    public void three()
    {
       // numList.add(1);
        numString=numString+'3';
    }
    public void four()
    {
       // numList.add(1);
        numString=numString+'4';
    }
    //--------------------------------- Account Search---------------------------------
    public list<account> accList{set;get;}
    public string accName{get;set;} 
    public void searchAccount()
    {
        string name = '%'+accName+'%';
        accList=[select name,id,phone from account where name like :name];
        system.debug(accName);
        system.debug(accList);
    }
    
    //--------------------------------- Weather Search---------------------------------
    public string location {get;set;}
    public string temp{get;set;}
    
    public void weatherClass()
    {
        temp = string.valueOf(rapidApiCallout.callWeatherMethod(location)) ;
    }
    
    
}