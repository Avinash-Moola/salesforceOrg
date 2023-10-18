import { LightningElement, wire, api } from 'lwc';
import Scenarios from '@salesforce/apex/TriggerScenariosController.getScenarios';

export default class TriggerScenarios extends LightningElement {
    Scenarios;
    objectApiName = 'abhisol__TriggerScenario__c';
    
     @wire(Scenarios)
     ScenariosData({ error, data }) {
       if (data) {
         this.Scenarios = data;
        // console.log('Data', data);
       } else if (error) {
         console.error('Error:', error);
       }
     }
 
  
}