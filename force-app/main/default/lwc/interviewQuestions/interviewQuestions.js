import { LightningElement,wire } from 'lwc';
import Questions from '@salesforce/apex/interviewQuestionsController.getQuestions';

export default class InterviewQuestions extends LightningElement {
   questionAndAnswers;
   objectApiName = 'abhisol__InterviewQuestion__c';
   
    @wire(Questions)
    QuestionsData({ error, data }) {
      if (data) {
        this.questionAndAnswers = data;
       // console.log('Data', data);
      } else if (error) {
        console.error('Error:', error);
      }
    }

}