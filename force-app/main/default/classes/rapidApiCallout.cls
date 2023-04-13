public class rapidApiCallout 
{
	private static decimal finalTemp;
    
    public static decimal callWeatherMethod(string city)
    {
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        
        string cityName = 'https://weatherapi-com.p.rapidapi.com/current.json?q='+city;
        req.setEndpoint(cityName);
        req.setHeader('X-RapidAPI-Key', '5f8f69430fmsh1f0200de0e07e8ep1af64fjsn1dafc191b86c');
		req.setHeader('X-RapidAPI-Host', 'weatherapi-com.p.rapidapi.com');
        req.setMethod('GET');
        
        
        HttpResponse res = http.send(req);
        system.debug('Response Status :'+res.getStatus());
        system.debug('Response code :'+res.getStatusCode());
        if(res.getStatusCode() == 200)
        {
            //system.debug(res.getBody());
            string jsonString = res.getBody();
            map<string,object> myMap= (map<string,object>)JSON.deserializeUntyped(jsonString);
            //system.debug(myMap);
            map<string,object> main = (map<string,object>)myMap.get('current');
            //system.debug(main);
            //system.debug(main.get('temp_f')+' Fahrenheit');
            //decimal celcius = fahrenheitToCelsius.conversionMethod((decimal)main.get('temp_f'));
            system.debug((((decimal)main.get('temp_f')-32) * 5/9).setscale(2) +' Celcius');
           finalTemp=(((decimal)main.get('temp_f')-32) * 5/9).setscale(2);
        }
        return finalTemp;
    }
}