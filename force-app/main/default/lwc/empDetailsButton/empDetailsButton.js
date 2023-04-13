import { LightningElement, track } from 'lwc';

export default class EmpDetailsButton extends LightningElement {
    @track name;
    @track age;
    @track show = true;

    nameHandler(event)
    {
        this.name = event.target.value;
    }

    ageHandler(event)
    {
        this.age = event.target.value;
    }

    saveHandler(event)
    {
        this.show=false;
    }
}