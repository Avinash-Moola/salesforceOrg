import { LightningElement } from 'lwc';

export default class TestParentComponent extends LightningElement {

    parentText;
    textFromChild;
    
    nameHandler(event){
    this.parentText = event.target.value;
    console.log(this.parentText);
    }

    childEventHandler(event){
        this.textFromChild = event.detail.chailage;
    }
}