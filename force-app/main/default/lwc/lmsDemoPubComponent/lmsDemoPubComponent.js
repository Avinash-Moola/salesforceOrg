import { LightningElement,wire } from 'lwc';
import {publish, messageContext} from 'lightning/messageService';
import lmsDemo from '@salesforce/messageChannel/lmsDemo__c';

export default class LmsDemoPubComponent extends LightningElement {
    firstName;
    lastName;

    handleChangeFirstName(event){
        this.firstName = event.target.value;
    }

    handleChangeLastName(event){
        this.lastName = event.target.value;
    }

   /*   @wire(messageContext)
   messageContext;      */

    handleClick(event){

        const payload = { 
            fieldName1: this.firstName,
            fieldName2: this.lastName
        };
        publish(this.messageContext, lmsDemo, payload);
    }
}