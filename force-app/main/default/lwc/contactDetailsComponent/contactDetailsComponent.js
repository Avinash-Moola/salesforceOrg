import { LightningElement,api } from 'lwc';

export default class ContactDetailsComponent extends LightningElement {
    @api objectApiName;
    @api recordId;
}