@restresource(urlmapping ='/getName/*')
global class getNameAndIdAPI 
{
	@HTTPget
    global static string getmethod()
    {
        string objName;		//	"objName" and "i" are defined in header in postman or other application
        id i;
        RESTrequest req = RESTcontext.request;
        RESTresponse res = RESTcontext.response;
        objName = req.headers.get('objName');		// geting header method
        i = req.headers.get('i');
        string qr = 'select name from '+objName+' where id = :i '+ 'limit 1';
        sObject s = database.query(qr);
        string jsonResponse = '{\"name\":\"'+s.get('name')+'\"}';
        return jsonResponse;
    }
    
    
    @HTTPpost
    global static string postMethod()
    {
        string obj;
        id i;
       
        RESTrequest req = RESTcontext.request;
        string js = req.requestBody.toString();
        JSONparser jp = JSON.createParser(js);
        while(jp.nextToken()!=null)
        {
            if(jp.getCurrentToken()!=JSONtoken.END_OBJECT)
            {
                string fieldName =jp.getCurrentName();
                string fieldValue = jp.getText();
                
                if(fieldName == 'objName')
                {
                    obj = fieldValue;
                }
                else if (fieldName =='id')
                {
                    i= fieldValue;
                }
            }
        }
        string qr = 'select id,name from '+ obj+ ' where id = :'+i;
        sObject a = database.query(qr);
        string jsOut = a.get('Name')+' '+a.get('id')+' '+a.get('NumberOfEmployees');
        
        return jsOut;
    }
    
    
}