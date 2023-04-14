import { LightningElement } from 'lwc';

export default class ValidationCheck extends LightningElement {

    handleOnClick(){
        let nameC = this.template.querySelector('.nameClass');
        let dateC = this.template.querySelector('.dateClass');

        let nameValue = nameC.value;
        //let dateValue = dateC.value;

        if(!nameValue){
            
            nameC.setCustomValidity('Enter Name..!');

        }
        else{
            nameC.setCustomValidity('');
        }
            
        nameC.reportValidity();

        if(!dateValue){
            dateC.setCustomValidity('Enter Date..!');

        }
        else{
            dateC.setCustomValidity('');
        }
        dateValue.reportValidity();

    }
}