public with sharing class interviewQuestionsController {
    @AuraEnabled(cacheable=true)
    public static list<abhisol__InterviewQuestion__c> getQuestions(){
        try {
            return [select id,abhisol__Question__c, abhisol__Answer__c, abhisol__MoreInfo__c from abhisol__InterviewQuestion__c];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}