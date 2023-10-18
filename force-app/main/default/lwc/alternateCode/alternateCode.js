import { LightningElement, api, wire } from 'lwc';
import NAME_FIELD from '@salesforce/schema/AlternateCode__c.Code__c';
import { getRelatedListRecords } from 'lightning/uiRelatedListApi';

export default class AlternateCode extends LightningElement {
    
    fields = [NAME_FIELD];
    @api recordId
    objectApiName = 'abhisol__AlternateCode__c';
    alternateCode
    
    @wire(getRelatedListRecords, {
       parentRecordId: '$recordId',
       //  parentRecordId: 'a0E5i00000El3d9EAB',
        relatedListId: 'abhisol__AlternateCodes__r',
        fields: ['abhisol__AlternateCode__c.abhisol__Code__c' ]
    })WorkExperiencesHandler({data, error}){
        if(data){
            this.alternateCode = data.records;
            // console.log(JSON.stringify(data))
            // console.log(data.records[0].fields.abhisol__Code__c.value)
        }
        if(error){
            console.error(error)
        } 
    }
    
   
}