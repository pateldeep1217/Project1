public with sharing class LiveClassController {
    
    @AuraEnabled(cacheable=true)
    public static List<Live_Class__c> getClassList(String searchKey){

        return [SELECT Id, Name, Product__r.Name, Starting__c, Ending__c, Total_Students__c FROM Live_Class__c WHERE Product__r.Name =: searchKey];
        
    }


    

}
