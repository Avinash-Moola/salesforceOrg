import { LightningElement } from 'lwc';

export default class BmiApp extends LightningElement {
    result;
    height;
    weight;
    health;

    heightChangeHandler(event){
        this.height = event.target.value;
        console.log(this.height);
    }

    weightChangeHandler(event){
        this.weight = event.target.value;
        console.log(this.weight);
    }

    calculate(){
       
       // console.log(this.weight);
       // console.log(this.height);
        this.result = ((this.weight * 10000) / (this.height  * this.height)).toFixed(2);
        console.log(this.result);

        if(this.result < 18.5){
            this.health = "Under Weight";
        }
        else if(this.result >= 18.5 && this.result < 24.9){
            this.health = "Healthy Weight";
        }
        else if(this.result >= 24.9 && this.result < 30){
            this.health = "Over Weight";
        }
        else if(this.result > 30){
            this.health = "Obeses";
        }
    }

    recalculate(){
        this.result='';
        this.height='';
        this.weight='';
        this.health='';
        this.result='';
    }



}