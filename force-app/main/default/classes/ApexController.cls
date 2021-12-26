public with sharing class ApexController {

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){
        return [SELECT Id, Name FROM Account LIMIT 10];
    }

    @AuraEnabled(cacheable=true)
    public static List<Live_Class__c> getLiveClasses(){
        return [SELECT Id, Product__r.Name, Starting__c FROM Live_Class__c];
    }



}
