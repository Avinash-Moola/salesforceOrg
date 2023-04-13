import { LightningElement, wire } from 'lwc';
import myMethod from '@salesforce/apex/LWCClass1.myMethod';

export default class E1LWC extends LightningElement {
    res = true;
    dispText="hi, hellow, how are you !";
    showHandler(event)
    {
        this.res = false;
    }
    
    hideHandler(event)
    {
        this.res = true;
        this.dispText;
    }
    Contacts = [
        {ID: 1, Name: "Avi" , Title : "Mr"},
        {ID : 2, Name: "Sony", Title: "Mrs"},
        {ID : 3, Name: "Xeon", Title: "Master"}
    ]
        
    @wire(myMethod) account;
}