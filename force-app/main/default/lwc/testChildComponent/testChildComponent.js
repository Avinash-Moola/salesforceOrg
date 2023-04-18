import { LightningElement, api } from 'lwc';

export default class TestChildComponent extends LightningElement {
    @api childText;
    @api cText;
     textFromChild;
     @api chailage;

     @api age;
     agechangeHandeler(event){
         this.age = event.target.value;
         const evn = new CustomEvent('chaildevent', {
             detail: {chailage:this.age}
         });
   
         this.dispatchEvent(evn);
     }
    
}