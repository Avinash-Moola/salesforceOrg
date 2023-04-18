import { LightningElement } from 'lwc';

export default class Parent1 extends LightningElement {
    parentText='';

    nameChangeHandler(event){
        this.parentText = event.target.value;

    }
}