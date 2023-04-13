import { LightningElement } from 'lwc';

export default class ParentComponent extends LightningElement {
    name;
    chaildName;

    onchangeHandler(event){
        this.name = event.target.value;
    }
    chaildEventHandler(event){
        this.chaildName = event.detail.chailage;
    }
}