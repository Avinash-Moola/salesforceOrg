import { LightningElement } from 'lwc';

export default class GetInTouch extends LightningElement {

    first_name;
    last_name;
    email;
    mobile;
    company;
    website;
    city;
    country;

    buttonFlag;


    inputChangeHandler(event){
        const evt = event.target;
        if(evt.name == "first_name"){
            this.first_name = evt.value;
            console.log(this.first_name);
        }
        if(evt.name == "last_name"){
            this.last_name = evt.value;
            console.log(this.last_name);
        }
        if(evt.name == "email"){
            this.email = evt.value;
            console.log(this.email);
        }
        if(evt.name == "mobile"){
            this.mobile = evt.value;
            console.log(this.mobile);
        }
        if(evt.name == "company"){
            this.company = evt.value;
            console.log(this.company);
        }
        if(evt.name == "website"){
            this.website = evt.value;
            console.log(this.website);
        }
        if(evt.name == "city"){
            this.city = evt.value;
            console.log(this.city);
        }
        if(evt.name == "country"){
            this.country = evt.value;
            console.log(this.country);
        }
        if((this.first_name || this.last_name) && (this.email || this.mobile)){
           const butt = this.template.querySelector('button');
           butt.disabled = false;
        }
        else{
            const butt = this.template.querySelector('button');
            butt.disabled = true;
        }
    }
    
        
}