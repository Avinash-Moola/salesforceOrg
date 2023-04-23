import { LightningElement } from 'lwc';
import { countryCodeList } from 'c/countryCodeList'
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CurrencyConverter extends LightningElement {
    countryCodeList = countryCodeList
    fromCountry='USD'
    toContury ='INR'
    outputCurrency
    inputCurrency
    exchangeValue

    setInputCurrency(){
        this.inputCurrency = Number((this.outputCurrency / this.exchangeValue)).toFixed(3)
    }
    setOutputCurrency(){
        this.outputCurrency = Number((this.exchangeValue * this.inputCurrency)).toFixed(3)
    }

    handleChangeFrom(event){
        this.fromCountry = event.target.value;
        this.inputCurrency = ''
        this.outputCurrency = ''
        this.checkFromAndToContury()
        // console.log(this.fromCountry);
    }

    handleChangeTo(event){
        this.toContury = event.target.value;
        this.inputCurrency = ''
        this.outputCurrency = ''
        this.checkFromAndToContury()
        // console.log(this.toContury);
    }

    inputHandler(event){
        this.inputCurrency = event.target.value
        this.setOutputCurrency()
        // this.outputCurrency = Number((this.exchangeValue * this.inputCurrency)).toFixed(3)
        //this.outputCurrency = this.inputCurrency
        console.log(this.outputCurrency);
    }

    outputHandler(event){
        this.outputCurrency = event.target.value
        this.setInputCurrency()
       // this.inputCurrency = Number((this.outputCurrency / this.exchangeValue)).toFixed(3)
        //this.outputCurrency = this.inputCurrency
        console.log(this.inputCurrency);

    }

    checkFromAndToContury(){
        if(this.fromCountry == this.toContury){
            console.log(this.fromCountry + ' and ' + this.toContury);
            this.exchangeValue = Number(1)
        }
        else{
            console.log(this.fromCountry + ' and ' + this.toContury);
            this.apiCall()
        }
    }

   async  apiCall(){
    // Setting Header and Method
    const options = {
        method: 'GET',
        headers: {
            'X-RapidAPI-Key': '5f8f69430fmsh1f0200de0e07e8ep1af64fjsn1dafc191b86c',
            'X-RapidAPI-Host': 'currency-exchange.p.rapidapi.com'
        }
    };
    
    // Setting Url
       try {
            let url = 'https://currency-exchange.p.rapidapi.com/exchange?from='+this.fromCountry+'&to='+this.toContury+'&q=10'
            const data = await fetch(url, options)
            const jsonData = await data.json()
            this.exchangeValue = Number(jsonData)
            console.log(this.exchangeValue)
       } catch (error) {
            console.log(error);
       }
      
    }

    
    connectedCallback() {
        this.apiCall()
    }

    
    

    
}