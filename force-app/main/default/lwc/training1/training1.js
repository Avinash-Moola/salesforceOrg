import { LightningElement, wire } from 'lwc';
import accountList from '@salesforce/apex/training1Class.getAccounts';

export default class Training1 extends LightningElement {

    @wire(accountList) accounts;
    
    
    handleClick(event) {
            // Prevent the default behavior of the button
            event.preventDefault();
            // Alert the message
            alert(this.message);

        }
    
}