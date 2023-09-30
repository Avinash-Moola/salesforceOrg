import { LightningElement, api, wire } from 'lwc';
import { getRelatedListRecords } from 'lightning/uiRelatedListApi';

export default class ExperienceComponent extends LightningElement {
    @api recordId
    WorkExperiences

    @wire(getRelatedListRecords, {
        parentRecordId: '$recordId',
        relatedListId: 'abhisol__WorkExperience__r',
        fields: ['abhisol__Work_Experience__c.abhisol__Company__c',
                'abhisol__Work_Experience__c.abhisol__Role__c',
                'abhisol__Work_Experience__c.abhisol__Location__c',
                'abhisol__Work_Experience__c.abhisol__StartDate__c',
                'abhisol__Work_Experience__c.abhisol__EndDate__c',
                'abhisol__Work_Experience__c.abhisol__Description__c',
                'abhisol__Work_Experience__c.abhisol__CurrentCompany__c',
                ],
        sortBy: ['abhisol__Work_Experience__c.abhisol__Company__c']
    })WorkExperiencesHandler({data, error}){
        if(data){
            this.WorkExperiences = data.records;
            // console.log(JSON.stringify(data))
            // console.log(data.records[0].fields.abhisol__Company__c.value)
        }
        if(error){
            console.error(error)
        } 
    }

}