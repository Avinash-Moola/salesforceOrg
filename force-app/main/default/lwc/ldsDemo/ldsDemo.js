import { LightningElement, api } from 'lwc';

export default class LdsDemo extends LightningElement {
    columns = 2;
    objectApiName = "Account";
    @api recordId;
    @api objectApiName;
}