import { LightningElement, track, wire } from 'lwc';

import myMethod from '@salesforce/apex/LWCClass1.myMethod';

export default class FetchAccountList extends LightningElement {
    
    @track accounts;
    @track error;
    @wire(myMethod) 
    accounts({error,data}){
        if(data)
        {
            this.accounts=data;
        }
        else if(error)
        {
            this.error=error;
            this.console.log(error);
        }
    }
    Contacts = [
        {ID: 1, Name: "Avi" , Title : "Mr"},
        {ID : 2, Name: "Sony", Title: "Mrs"},
        {ID : 3, Name: "Xeon", Title: "Master"}
    ]
}