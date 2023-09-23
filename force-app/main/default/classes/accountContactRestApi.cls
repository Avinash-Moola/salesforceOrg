@restResource(urlMapping = '/accCon/*')
global class accountContactRestApi {

    @httpGet 
    global static list<account> getMethod(){
       restRequest req = restContext.request;
       string accId = req.requestURI.subString(req.requestURI.lastIndexOf('/')+1);
        
        return [select id,name,phone,NumberOfEmployees,Rating,Website,(SELECT Id, FirstName, LastName, Email FROM Contacts), (select id, Amount, StageName from Opportunities ) from account where id = :accId ];
    }
/*	//----------      using wraper clas			----------//
   @httpGet
    global static accountContactWrapper getMethod(){
        RestRequest req = RestContext.request;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/') + 1);
        
        return new accountContactWrapper(accountId);
    }
    global class accountContactWrapper {
       	global	Account accounts;
        global  List<Contact> contacts;
            
            global accountContactWrapper(string accountId){
                accounts = [SELECT Id, Name FROM Account where id = :accountId limit 1];
                contacts = [SELECT Id, FirstName, LastName, Email FROM Contact where accountId = :accounts.id];
            }
        }
*/	//----------	 If we know our sObject name		----------//
/*	@httpPost
    global static Account postMethod(){
        restRequest req = restContext.request;
        string jsonString = req.requestBody.toString();
       account account = (Account)JSON.deserialize(jsonString, Account.class);
        insert account;
        return account;
    }
*/  
    //----------	 If we dont know our sObject name		----------//
    @httpPost
    global static id postMethod(){
        RestRequest req = Restcontext.request;
        string jsonString = req.requestBody.toString();
        map<string,object> myMap = (map<string,object>)JSON.deserializeUntyped(jsonString);
        string aName, aPhone, aRating, aWebsite, aIndustry, aBillingCity, aBillingState;
        integer aNumberOfEmployees;
        for(string s:myMap.keySet())
        {
            if(s=='Name'){
                aName =(string)myMap.get(s);
                system.debug(aName);
            }
            else if(s=='Phone'){
                aPhone = (string)myMap.get(s);
                system.debug(aPhone);
            }
            else if (s=='NumberOfEmployees'){
                aNumberOfEmployees = integer.valueOf(myMap.get(s));
            }
            else if(s=='Rating'){
                aRating = (string)myMap.get(s);
            }
            else if(s=='Website'){
                aWebsite = (string)myMap.get(s);
            }
            else if(s=='Industry'){
                aIndustry = (string)myMap.get(s);
            }
            else if(s=='BillingCity'){
                aBillingCity = (string)myMap.get(s);
            }
            else if(s=='BillingState'){
                aBillingState = (string)myMap.get(s);
            }
            
        }
        Account acc = new Account(Name=aName, Phone=aPhone, NumberOfEmployees=aNumberOfEmployees, Rating=aRating, Website=aWebsite, Industry=aIndustry, BillingCity=aBillingCity, BillingState=aBillingState);
        insert acc;
        return acc.id;
    }
}