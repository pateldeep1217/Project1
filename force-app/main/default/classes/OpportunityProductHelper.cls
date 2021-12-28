public with sharing class OpportunityProductHelper {
    public static void OpoortunityLineItem(List<OpportunityLineItem> oppLineItem){
        for(OpportunityLineItem oppProduct:oppLineItem){
            system.debug(oppProduct.OpportunityId);
            List<Opportunity> accRecs = [SELECT Id, AccountId from Opportunity];
            
            
            for(Opportunity accRec: AccRecs){
                if(oppProduct.OpportunityId == accRec.Id){
                    system.debug(accRec.AccountId);
                    oppProduct.Customer_Account__c =accRec.AccountId;
                }
                
            }
            
        }
    }
}
