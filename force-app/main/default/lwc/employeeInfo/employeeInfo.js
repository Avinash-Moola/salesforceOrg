import { LightningElement, track } from 'lwc';

export default class EmployeeInfo extends LightningElement {
   @track name;
   nameHandler(event)
    {
        this.name1=event.target.value;
        this.name=name1;
    }

    @track age;
    ageHandler(event)
    {
        this.age=event.target.value;
    }

    @track salary;
    salaryHandler(event)
    {
        this.salary = event.target.value;
    }
}