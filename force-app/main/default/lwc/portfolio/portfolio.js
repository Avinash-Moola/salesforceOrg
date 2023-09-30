import { LightningElement, track, wire, api } from 'lwc';
import profilePic from '@salesforce/resourceUrl/aviPic';
import PortfolioAssets from '@salesforce/resourceUrl/PortfolioAssets';
import ABOUT_ME_LABEL from '@salesforce/label/c.res_About_Description';
import backgroungImg from '@salesforce/resourceUrl/backgroungImg';

export default class LightningExampleVerticalNavAdvanced extends LightningElement {
    @track selectedItem = 'about_me';
    aboutMeFlag;
    experienceFlag;
    educationFlag
    skillsFlag;
    certificationsFlag;
    contactMeFlag;
    modelComponentFlage = false;


    //* Model component ---------
    modelComponentHandler(event){
        this.modelComponentFlage = true
    }

    modelEventHandler(event){
        this.modelComponentFlage = event.detail.modelflag;
       //* console.log("From Parent "+ this.modelComponentFlage);
    }

    //* Model component ---------

    //* Static Resource 
    profilePic = profilePic;
    linkedin = PortfolioAssets +`/Social/linkedin.svg`
    trailhead = `${PortfolioAssets}/Social/trailhead.svg`
    github = `${PortfolioAssets}/Social/github.svg`
    twitter = PortfolioAssets + `/Social/twitter.svg`
    youtube = PortfolioAssets + `/Social/youtube.svg`
    backgroungImg = backgroungImg;

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

    


// controlling layout item templates 
    handleSelect(event) {
        const selected = event.detail.name;
        if(selected == 'about_me'){
            this.aboutMeFlag = true;
            this.experienceFlag = false;
            this.educationFlag = false;
            this.skillsFlag = false;
            this.certificationsFlag = false;
            this.contactMeFlag = false;
        }
        else if(selected == 'experience'){
            this.aboutMeFlag = false;
            this.experienceFlag = true;
            this.educationFlag = false;
            this.skillsFlag = false;
            this.certificationsFlag = false;
            this.contactMeFlag = false;
        }
        else if(selected == 'education'){
            this.aboutMeFlag = false;
            this.experienceFlag = false;
            this.educationFlag = true;
            this.skillsFlag = false;
            this.certificationsFlag = false;
            this.contactMeFlag = false;
        }
        else if(selected == 'skills'){
            this.aboutMeFlag = false;
            this.experienceFlag = false;
            this.educationFlag = false;
            this.skillsFlag = true;
            this.certificationsFlag = false;
            this.contactMeFlag = false;
        }
        else if(selected == 'certifications'){
            this.aboutMeFlag = false;
            this.experienceFlag = false;
            this.educationFlag = false;
            this.skillsFlag = false;
            this.certificationsFlag = true;
            this.contactMeFlag = false;
        }
        else if(selected == 'contactMe'){
            this.aboutMeFlag = false;
            this.experienceFlag = false;
            this.educationFlag = false;
            this.skillsFlag = false;
            this.certificationsFlag = false;
            this.contactMeFlag = true;
        }
    }


}
