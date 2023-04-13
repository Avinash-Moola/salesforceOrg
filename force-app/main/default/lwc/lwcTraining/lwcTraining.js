import { LightningElement ,api} from 'lwc';

export default class LwcTraining extends LightningElement {
    
    @api text1

    outPutText;
    propertyFlag = false;
    buttonLabel ='Show';
    i = 0;

    oChangeHandler(event){
        this.outPutText = event.target.value;
    }

    handleClick(){
        this.i++;
        if (!this.propertyFlag) {
            this.propertyFlag = true;
            this.buttonLabel = 'Hide';
            this.target.value = 'Hide';
        } else  {
            this.propertyFlag = false;
            this.buttonLabel = 'Show';
            this.target.value = 'Show';
            alert(this.propertyFlag)
        }
    }
}