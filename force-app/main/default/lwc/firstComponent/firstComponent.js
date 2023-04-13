import { LightningElement, track, wire } from 'lwc';
import searchAccounts from '@salesforce/apex/AccountController.searchAccounts';

const columns = [
  { label: 'Name', fieldName: 'Name', type: 'text' },
  { label: 'Phone', fieldName: 'Phone', type: 'phone' },
  { label: 'Website', fieldName: 'Website', type: 'url' }
];

export default class AccountSearch extends LightningElement {
  @track searchTerm = '';
  @track accounts = null;
  columns = columns;

  handleSearchTermChange(event) {
    this.searchTerm = event.target.value;
  }

  @wire(searchAccounts, { searchTerm: '$searchTerm' })
  wiredAccounts({ error, data }) {
    if (data) {
      this.accounts = data;
    } else if (error) {
      console.error(error);
    }
  }
}