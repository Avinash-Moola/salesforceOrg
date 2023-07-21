import { LightningElement } from 'lwc';
import contactList from '@salesforce/apex/findContactWithAccountController.searchContacts';

const columns = [
    { label: 'Name', fieldName: 'LastName', type: 'text' },
    { label: 'Phone', fieldName: 'Phone', type: 'phone' },
    { label: 'Email', fieldName: 'Email', type: 'email' }
  ];

export default class FindContactWithAccount extends LightningElement {
     accName ;
     conList;
     columns = columns;

    nameChangeHandler(event){
        this.accName = event.target.value;
    }

    handleClick(){
        contactList({ accName :this.accName})
        .then(result => {
            this.conList = result
            console.log(this.conList);
        })
        .catch(error => {
            console.error(error)
        });
    }
}