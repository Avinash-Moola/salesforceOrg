@RESTResource(urlMapping = '/CreateAccount/*')
global class AccountCreateAPI 
{
	@HTTPget
    global static Account getMethod()
    {
        RestRequest req = RestContext.request;
        string leadID = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        system.debug(req.requestURI);
        system.debug(req.requestURI.lastIndexOf('/')+1);
        system.debug(leadID);
        account l = [select id,name,NumberOfEmployees,AnnualRevenue  from account where id = :leadID ];
        return l;
    }
    
   /*@HTTPpost
    global static id postMethod(string accName, string rate, integer employees)			// this is one way 
    {
        account a = new account(name=accName, Rating = rate, NumberOfEmployees=employees);
        insert a;
        return a.id;
    }*/
    
    /* @HTTPpost
    global static id postMethod()			// this is one way 
    {
        restrequest req = restcontext.request;			// assigining rest data to req variable
       string tex1 = req.requestBody.toString();		// getting body from req and converting it to JSON string (bulb format) 
        object obj = JSON.deserializeUntyped(tex1);		// converting bulb data in to object format
        map<string, object> myMap = (map<string,object>)obj;	// converting object in to map of string and object
		
        system.debug(myMap.values());
        system.debug(myMap.keyset());
        
        string accName1,rate1;
        integer employees1;
        for (string k:myMap.keyset())
        {
            if(k == 'accName')
            {
                system.debug(myMap.get(k));
                accName1 = (string)myMap.get(k);
            }
            else if (k == 'rate')
            {
                system.debug(myMap.get(k));
                rate1 = (string)myMap.get(k);
            }
            else if (k == 'employees')
            {
                system.debug(myMap.get(k));
                employees1 = (integer)myMap.get(k);
            }
        }
        account a = new account(name=accName1, Rating = rate1, NumberOfEmployees=employees1);
        insert a;
        return a.id;
		
    }*/
    
    @httppost
    global static account postMethod()
    {
        string FieldName,FieldValue,accName,rate,name,Rating,NumberOfEmployees;
        integer employees;
        
        RESTrequest req = RESTcontext.request;
        string jstring = req.requestBody.tostring();
        JSONparser jp = JSON.createParser(jstring);
      
        while (jp.nextToken()!=null)
        {
           if(jp.getCurrentToken()!=JSONToken.END_OBJECT)
           {
             FieldName = jp.getCurrentName();
             FieldValue = jp.getText();  
           }
            if(fieldName == name)
            {
                accName =fieldValue;
            }
            else if(fieldName == Rating)
            {
                rate =fieldValue;
            }
             else if(fieldName == NumberOfEmployees)
            {
                employees =jp.getIntegerValue();
            }
        }
        
        account a= new account(name =accName,Rating=rate,NumberOfEmployees = employees );
        insert a;
        return a;
    }
}