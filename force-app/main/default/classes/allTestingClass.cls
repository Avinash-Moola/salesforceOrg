public with sharing class allTestingClass {
   private static Decimal tempInFahrenheit;
    @AuraEnabled
    public static decimal getTempFahrenheit(string city){
        try {
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            
            string cityName = 'https://weatherapi-com.p.rapidapi.com/current.json?q='+city;
            request.setEndpoint(cityName);
            request.setHeader('X-RapidAPI-Key', '5f8f69430fmsh1f0200de0e07e8ep1af64fjsn1dafc191b86c');
            request.setHeader('X-RapidAPI-Host', 'weatherapi-com.p.rapidapi.com');
            request.setMethod('GET');
            HttpResponse response = http.send(request);
            String responseBody = response.getBody();

            if(response.getStatusCode()==200){
                string jsonString = response.getBody();
                Map<string, object> myMap = (Map<String,Object>)JSON.deserializeUntyped(jsonString); 
                map<String, Object> main = (Map<String,Object>)myMap.get('current');
                tempInFahrenheit = (decimal)main.get('temp_f');
            }
            return tempInFahrenheit;

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}