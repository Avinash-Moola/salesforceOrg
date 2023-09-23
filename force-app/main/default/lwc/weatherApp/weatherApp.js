import { LightningElement } from 'lwc';
import weatherAppIcons from '@salesforce/resourceUrl/weatherAppIcons';
import getWeatherDetails from '@salesforce/apex/weatherApiController.getWeatherDetails'

export default class WeatherApp extends LightningElement {
    arrowBackIcon = weatherAppIcons+'/weatherAppIcons/arrow-back.svg'
    cloudIcon = weatherAppIcons+'/weatherAppIcons/cloud.svg'
    clearIcon = weatherAppIcons+'/weatherAppIcons/clear.svg'
    dropletIcon = weatherAppIcons+'/weatherAppIcons/droplet.svg'
    hazeIcon = weatherAppIcons+'/weatherAppIcons/haze.svg'
    mapIcon = weatherAppIcons+'/weatherAppIcons/map.svg'
    rainIcon = weatherAppIcons+'/weatherAppIcons/rain.svg'
    snowIcon = weatherAppIcons+'/weatherAppIcons/snow.svg'
    stormIcon = weatherAppIcons+'/weatherAppIcons/storm.svg'
    thermometerIcon = weatherAppIcons+'/weatherAppIcons/thermometer.svg'

    cityName = 'New York'
    temp
    temp_c
    temp_f 
    humidity 
    feelslike
    feelslike_c
    feelslike_f
    windSpeed
    windSpeed_kph
    windSpeed_mph 
    locationName 
    locationRegion 
    locationCountry 
    conditionText

    weatherIcon

    flag = false
    angle
    buttonFlag = true

    inputCityNameHandler(event){
        this.cityName = event.target.value
    }
    
    
    constructor(){
        super()
        this.buttonFlag = true
    }
    
    connectedCallback(){
        this.apiCall()

    }

    unitsHandler(event){
        if (event.target.value === 'celcius') {
            this.temp = this.temp_c +'°C'
            this.feelslike = this.feelslike_c +'°C'
            this.windSpeed = this.windSpeed_kph + 'kmph'
            this.buttonFlag = false
        }
        else if (event.target.value === 'farnheat') {
            this.temp = this.temp_f + '°F'
            this.feelslike = this.feelslike_f + '°F'
            this.windSpeed = this.windSpeed_mph + 'mph'
            this.buttonFlag = true
        }
    }

    buttonHandler(){
        if(!this.flag){
            this.flag=true
            this.angle = 0
            this.buttonFlag = true
        }
        else{
            this.flag=false
            this.angle=180
            this.cityName = ''
            this.weatherIcon=''

            this.temp_c = ''
            this.temp_f = ''
            this.humidity = ''
            this.feelslike_c = ''
            this.feelslike_f = ''
            this.windSpeed_kph = ''
            this.windSpeed_mph = ''
            this.locationName = ''
            this.locationCountry = ''
        }
        this.rotateButton()
        console.log(this.flag)
       this.apiCall()
       this.buttonFlag = true
       this.temp = this.temp_c +'°C'
       this.feelslike = this.feelslike_c +'°C'
       this.windSpeed = this.windSpeed_kph + 'kmph'
       
    }

  /* client side calling
    async apiCall(){
        const url = 'https://weatherapi-com.p.rapidapi.com/current.json?q='+this.cityName;
        const options = {
            method: 'GET',
            headers: {
                'content-type': 'application/octet-stream',
                'X-RapidAPI-Key': '5f8f69430fmsh1f0200de0e07e8ep1af64fjsn1dafc191b86c',
                'X-RapidAPI-Host': 'weatherapi-com.p.rapidapi.com'
            }
        };
        
        try {
            const response = await fetch(url, options);
            const result = await response.json();
            console.log(result.current.temp_c);
            
            this.temp_c = result.current.temp_c
            this.temp_f = result.current.temp_f
            this.humidity = result.current.humidity
            this.feelslike_c = result.current.feelslike_c
            this.feelslike_f = result.current.feelslike_f
            this.windSpeed_kph = result.current.wind_kph
            this.windSpeed_mph = result.current.wind_mph
            this.conditionText = result.current.condition.text
            this.conditionCode = result.current.condition.code
            this.locationName = result.location.name
            this.locationRegion = result.location.region
            this.locationCountry = result.location.country

           
        } catch (error) {
            console.error(error);
        }
    } */

   

    rotateButton() {
        const but  = this.template.querySelector('.my-icon');
        but.style.transform = `rotate(${this.angle}deg)`;
    }


    apiCall(){
        console.log("cityName", this.cityName)
        getWeatherDetails({input:this.cityName})
        .then(result=>{
           this.weatherDetails(JSON.parse(result))
           console.log(JSON.parse(result))
        }).catch((error)=>{
          console.error(error)
          alert('Check City Name...')
        })
        
        this.temp = this.temp_c +'°C'
        this.feelslike = this.feelslike_c +'°C'
        this.windSpeed = this.windSpeed_kph + 'kmph'
      }

      weatherDetails(info){
        console.log(info);
        if(info.cod === "404"){
            console.log('Error...');
      }else {
        const {description, id} = info.weather[0]
        if(id === 800){
            this.weatherIcon = this.clearIcon
            const condtion = description
            this.conditionText = condtion
        } else if((id>=200 && id <=232) ){
            this.weatherIcon = this.stormIcon
            const condtion = description
            this.conditionText = condtion
        } else if(id>=701 && id <=781){
            this.weatherIcon = this.hazeIcon
            const condtion = description
            this.conditionText = condtion
        } else if(id>=801 && id <=804){
            this.weatherIcon = this.cloudIcon
            const condtion = description
            this.conditionText = condtion
        } else if((id>=500 && id <=531) || (id>=300 && id<= 321)){
            this.weatherIcon = this.rainIcon
            const condtion = description
            this.conditionText = condtion
        } else if((id>=600 && id <=602) || (id>=611 && id<= 622)){
            this.weatherIcon = this.snowIcon
            const condtion = description
            this.conditionText = condtion
        } else {}
        
        const temp = info.main.temp
        const humidity = info.main.humidity
        const feelslike = info.main.feels_like
        const windSpeed = info.wind.speed
        const locationName = info.name
        const locationCountry = info.sys.country

        console.log(locationName + locationCountry + temp + humidity +windSpeed);

            this.temp_c = temp
            this.temp_f = ((temp * 9/5)+32).toFixed(2)
            this.humidity = humidity
            this.feelslike_c = feelslike
            this.feelslike_f = ((feelslike * 9/5)+32).toFixed(2)
            this.windSpeed_kph = windSpeed
            this.windSpeed_mph = (windSpeed/1.609344) .toFixed(2)
            this.locationName = locationName
            this.locationCountry = locationCountry


      }
    }
    
      

 
}