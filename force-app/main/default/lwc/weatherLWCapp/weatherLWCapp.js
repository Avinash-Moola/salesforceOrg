import { LightningElement } from 'lwc';
import getWeather from '@salesforce/apex/WeatherController.getWeather';

export default class WeatherLWCapp extends LightningElement {
  city;
  temp;

  changeHandler(event){
    this.city = event.target.value;
  }
  handleClick(){
    getWeather({ location: this.city })
    .then(result => {
        if(result != null){
            this.temp = result ;
        }
        else{
            alert("Check your City Name...!");
        }
    })
    .catch(error => {
        console.error(error)
        alert("Check your City Name...!");
    });
  }
  
}