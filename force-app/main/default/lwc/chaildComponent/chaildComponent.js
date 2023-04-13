import { LightningElement,api } from 'lwc';

export default class ChaildComponent extends LightningElement {
    @api chaildText;
    @api age;
    agechangeHandeler(event){
        this.age = event.target.value;
        const evn = new CustomEvent('chaildevent', {
            detail: {chailage:this.age}
        });

        this.dispatchEvent(evn);
    }
}