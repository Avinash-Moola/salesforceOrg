import { LightningElement, api, wire } from 'lwc';
import { getRelatedListRecords } from 'lightning/uiRelatedListApi';

const COLUMNS = [
    { label: 'Education', fieldName: 'EducationName', wrapText: true },
    { label: 'Institution Name', fieldName: 'InstitutionName', wrapText: true },
    { label: 'Location', fieldName: 'Education', wrapText: true  },
    { label: 'Passing Year', fieldName: 'PassingYear' },
];

export default class EducationComponent extends LightningElement {
    tableData = []
    columns = COLUMNS
    @api recordId

    @wire(getRelatedListRecords, {
        parentRecordId:"$recordId",
        relatedListId:'abhisol__Educations__r',
        fields:['abhisol__Education1__c.Name', 'abhisol__Education1__c.abhisol__Collage__c','abhisol__Education1__c.abhisol__Location__c','abhisol__Education1__c.abhisol__YearOfPassing__c'],
        sortBy:['abhisol__Education1__c.abhisol__YearOfPassing__c']
    })EducationHandler({data, error}){
        if(data){
            // console.log( JSON.stringify(data))
            this.formatData(data)
        }
        if(error){
            console.error("EducationHandler error", error)
        }
    }

    formatData(data){
        this.tableData = [...data.records].reverse().map(item=>{
            let Id = item.id
            const {Name,abhisol__Collage__c, abhisol__Location__c, abhisol__YearOfPassing__c} = item.fields
            let EducationName = Name.value
            let Education = abhisol__Location__c.value
            let InstitutionName = abhisol__Collage__c.value
            let PassingYear = abhisol__YearOfPassing__c.value
            return {
                Id,EducationName,Education, InstitutionName, PassingYear
            }
        })

        // console.log("this.tableData", JSON.stringify(this.tableData))
    }
}