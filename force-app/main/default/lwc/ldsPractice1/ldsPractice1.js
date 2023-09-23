import { LightningElement, wire, api } from 'lwc';
import { getFieldValue, getRecord } from 'lightning/uiRecordApi';


export default class LdsPractice1 extends LightningElement {

 
  @api recordId;

  @wire(getRecord, {recordId : `$recordId`, fields:['Account.Name','Account.Phone']})
  record;
  get accName(){
    return this.record.data ? getFieldValue(this.record.data, 'Account.Name') : '';
  }

  get accPhone(){
    return this.record.data ? getFieldValue(this.record.data, 'Account.Phone')  : '';
  }


}