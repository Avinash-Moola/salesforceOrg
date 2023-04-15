import { LightningElement } from 'lwc';
import getTempFahrenheit from '@salesforce/apex/allTestingClass.getTempFahrenheit';

export default class AllTesting extends LightningElement {

    temp;
    city ='';
    error;
    finalTemp;
    
    celsiusHandler(){
        this.finalTemp = ((this.temp-32) *5/9).toFixed(2);
    }
    fahrenheitHandler(){
        this.finalTemp = this.temp.toFixed(2);
    }

    changeHandler(event){
        this.city = event.target.value;
    }

    handleOnClick(){
        getTempFahrenheit({ city: this.city })
        .then((result) => {
            if(result != ''){
                this.temp = result;
                this.error = undefined;

            }
            else{
                alert("Check Your Spelling...!")
            }
        })
        .catch((error) => {
            this.error = error;
            this.temp = undefined;
            console.error(error);
            alert('Check Your Spelling...!')
        });
        
    }
}