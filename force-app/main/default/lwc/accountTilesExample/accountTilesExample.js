import { LightningElement,wire } from 'lwc';
import searchAccounts from '@salesforce/apex/AccountController.searchAccounts';
import { NavigationMixin } from 'lightning/navigation';

export default class AccountTilesExample extends NavigationMixin(LightningElement) {
    accountList = null;
    error;
    searchTerm='oil';

    changeHandler(event){
        this.searchTerm=event.target.value;
    }

    @wire(searchAccounts, { searchTerm: '$searchTerm' })
    accountList({ error, data }) {
      if (data) {
        this.accountList = data;
      } else if (error) {
        console.error(error);
      }
    }

    clickHandle(event){
        let a = event.target.dataset.value;
        // alert('Hi '+a);
        // console.log(a);

        this[NavigationMixin.Navigate]({
            type: 'standard__webPage',
            attributes: {
                "url": 'https://'+a
            }
        });
    }

    
}