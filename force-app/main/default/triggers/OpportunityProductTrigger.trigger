trigger OpportunityProductTrigger on OpportunityLineItem (before insert) {
    Switch on Trigger.OperationType {
        when BEFORE_INSERT {
            
            for(OpportunityLineItem oppProduct:Trigger.new){
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
        when BEFORE_UPDATE {
            
        }
        when BEFORE_DELETE {
            
        }
        when AFTER_INSERT {

        }
        when AFTER_UPDATE {
            
        }
        when AFTER_DELETE {
            
        }
        when AFTER_UNDELETE {
            
        } when else {
            
        }
        
    }
}