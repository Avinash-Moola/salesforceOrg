public with sharing class TriggerScenariosController {
    @AuraEnabled(cacheable=true)
    public static list<abhisol__TriggerScenario__c> getScenarios(){
        try {
            return [select id,abhisol__Scenario__c,abhisol__Code__c from abhisol__TriggerScenario__c];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}