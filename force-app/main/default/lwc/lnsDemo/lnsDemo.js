import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class LnsDemo extends NavigationMixin(LightningElement) {
    handleClickObjectPage(){
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'home'   // new - to create new Account
            },
            state: {
                 // Different per page type.
                 // filterName: 'Recent' use with 'list'
            }
        });
    }

    handleClickRecordPage(){
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: '0015i00000AVb4RAAT',
                objectApiName: 'Account',
                actionName: 'view'     // edit - to edit record
            }
        });
    }

    handleClickUrlPage(){
        this[NavigationMixin.Navigate]({
            type: 'standard__webPage',
            attributes: {
                url: 'https://www.google.com/'
            }
        });
    }


}