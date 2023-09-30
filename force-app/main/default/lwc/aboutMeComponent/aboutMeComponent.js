import { LightningElement,api,wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import FULL_NAME from '@salesforce/schema/Portfolio__c.Name__c'
import DESIGNATION from '@salesforce/schema/Portfolio__c.Designation__c'
import COMPANY from '@salesforce/schema/Portfolio__c.Company__c'
import CITY from '@salesforce/schema/Portfolio__c.City__c'
import COUNTRY from '@salesforce/schema/Portfolio__c.Country__c'

export default class AboutMeComponent extends LightningElement {
    @api recordId;
    @api objectApiName;
    
    // about me details
    fullName;
    designation;
    company;
    city;
    country;
    aboutMeFromLabel;
    
    @wire(getRecord, { recordId:'$recordId', fields: [FULL_NAME, DESIGNATION, COMPANY, CITY, COUNTRY] })
    portfolioHandler({data,error}){
        if(data){
             //console.log(JSON.stringify(data))
            // console.log(data.fields.abhisol__Name__c.value);
            this.fullName = data.fields.abhisol__Name__c.value.toUpperCase();
            this.designation = data.fields.abhisol__Designation__c.value;
            this.company = data.fields.abhisol__Company__c.value;
            this.city = data.fields.abhisol__City__c.value;
            this.country = data.fields.abhisol__Country__c.value;

        }
        if(error){
            console.error("error",error);
        }
    }

}