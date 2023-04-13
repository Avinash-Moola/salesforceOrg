public class AnimalCallout 
{
	public static void calloutMethod()
    {
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        req.setMethod('GET');
        
        HttpResponse res = http.send(req);
        system.debug('Response Status :'+res.getStatus());
        system.debug('Response code :'+res.getStatusCode());
        
        if(res.getStatusCode() == 200)
        {
            map<string,object> myMap = (map<string,object>)JSON.deserializeUntyped(res.getBody());
            system.debug(myMap.get('animals'));
            for(string s:myMap.keyset())
            {
                for(object o:(list<object>)myMap.get(s))
                    {
                        system.debug(o);
                    }
            }
        }
    }
   
    
 /*   
    public static set<string> myMethod()
    {
		list<string> l1 = new list<string>{'aa','bb','cc','aa','dd','ee','ff','bb'};
        set<string> s1 = new set<string>();
        set<string> s2 = new set<string>();
        for(string s: l1)
        {
            if(!s1.add(s))
            {
                s2.add(s);
            }
        }
        system.debug(s2);
        return s2;
    } */
}