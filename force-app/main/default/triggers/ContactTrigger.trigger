trigger ContactTrigger on Contact (before insert, after insert) {
    
    Switch on Trigger.OperationType {
        when BEFORE_INSERT {
            
        } 
        when BEFORE_UPDATE {
            
        }
        when BEFORE_DELETE {
            
        }
        when AFTER_INSERT {
            
            for(Contact contactRec: Trigger.new){        
                system.debug(contactRec.AccountId);
                List<Account> accountRecs = [SELECT Id, Email__c From Account WHERE Id =:contactRec.AccountId];
                for(Account accountRec:accountRecs){
                    system.debug(accountRec.Id);
                    if(contactRec.AccountId == accountRec.Id){
                        accountRec.Email__c = contactRec.Email;
                    }
                }
            }
            
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