@RestResource(URLmapping='/myApi/*')
global with sharing class restResourceExample
{
    @HttpGet
    global static Account getMethod()
    {
        RestRequest req = Restcontext.request;
        string AccId = req.RequestURI.substring(req.requestURI.lastindexOf('/')+1);
        Account acc = [select name from account where id = :AccId];
        return acc;
    }
    
    @HttpPost
    global static void postMethod(string accName, string numOfEmployees)
    {
        RestRequest req = RestContext.request;
        string accId = req.RequestURI.substring(req.requestURI.lastIndexOf('/')+1);
        
    }
}