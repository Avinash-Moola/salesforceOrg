import { LightningElement, track, wire, api } from 'lwc';
import profilePic from '@salesforce/resourceUrl/aviProflePic';
import PortfolioAssets from '@salesforce/resourceUrl/PortfolioAssets';
import { getFieldValue, getRecord } from 'lightning/uiRecordApi';
import FULL_NAME from '@salesforce/schema/Portfolio__c.Name__c'
import DESIGNATION from '@salesforce/schema/Portfolio__c.Designation__c'
import COMPANY from '@salesforce/schema/Portfolio__c.Company__c'
import CITY from '@salesforce/schema/Portfolio__c.City__c'
import COUNTRY from '@salesforce/schema/Portfolio__c.Country__c'
import ABOUT_ME_LABEL from '@salesforce/label/c.res_About_Description';

export default class LightningExampleVerticalNavAdvanced extends LightningElement {
    @track selectedItem = 'about_me';
    aboutMeFlag;
    experienceFlag;
    educationFlag
    skillsFlag;
    certificationsFlag;

    // about me details
    fullName;
    designation;
    company;
    city;
    country;
    aboutMeFromLabel;

    //* Static Resource 
    profilePic = profilePic;
    linkedin = PortfolioAssets +`/Social/linkedin.svg`
    trailhead = `${PortfolioAssets}/Social/trailhead.svg`
    github = `${PortfolioAssets}/Social/github.svg`
    twitter = PortfolioAssets + `/Social/twitter.svg`
    youtube = PortfolioAssets + `/Social/youtube.svg`

    @api linkedinUrl
    @api trailheadUrl
    @api githubUrl
    @api twitterUrl
    @api youtubeUrl


    //* About me detail from Custom Label
    aboutMeFromLabel = ABOUT_ME_LABEL;

    //* fetching Portfolio object and fields
    @api recordId // = 'a0A5i000009rIEmEAM';

    //* object api name
    objectApiName = 'abhisol__Portfolio__c';

    @wire(getRecord, { recordId:'$recordId', fields: [FULL_NAME, DESIGNATION, COMPANY, CITY, COUNTRY] })
    portfolioHandler({data,error}){
        if(data){
             console.log(JSON.stringify(data))
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


// controlling layout item templates 
    handleSelect(event) {
        const selected = event.detail.name;
        if(selected == 'about_me'){
            this.aboutMeFlag = true;
            this.experienceFlag = false;
            this.educationFlag = false;
            this.skillsFlag = false;
            this.certificationsFlag = false;
        }
        else if(selected == 'experience'){
            this.aboutMeFlag = false;
            this.experienceFlag = true;
            this.educationFlag = false;
            this.skillsFlag = false;
            this.certificationsFlag = false;
        }
        else if(selected == 'education'){
            this.aboutMeFlag = false;
            this.experienceFlag = false;
            this.educationFlag = true;
            this.skillsFlag = false;
            this.certificationsFlag = false;
        }
        else if(selected == 'skills'){
            this.aboutMeFlag = false;
            this.experienceFlag = false;
            this.educationFlag = false;
            this.skillsFlag = true;
            this.certificationsFlag = false;
        }
        else if(selected == 'certifications'){
            this.aboutMeFlag = false;
            this.experienceFlag = false;
            this.educationFlag = false;
            this.skillsFlag = false;
            this.certificationsFlag = true;
        }
    }


}
