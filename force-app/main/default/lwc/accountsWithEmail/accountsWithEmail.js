import { LightningElement, wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';


export default class AccountsWithEmail extends LightningElement {
    accounts

    @wire(getAccounts)
    getAccounts

 
}