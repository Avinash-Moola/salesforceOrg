import { LightningElement,api } from 'lwc';

export default class ModelComponent extends LightningElement {
    @api modelflag = false;
    handelClose(event){
        console.log("Cancle clicked");
        const evn = new CustomEvent('modelevent', {
            detail: {modelflag:this.modelflag}
        });

        this.dispatchEvent(evn);
        //* console.log(this.modelflag);
    }
}