trigger AccountTriggerAssignment on Account (before insert, after insert, after update) {
    
     Switch on Trigger.OperationType {
        when BEFORE_INSERT {
            
        } 
        when BEFORE_UPDATE {
            
        }
        when BEFORE_DELETE {
            
        }
        when AFTER_INSERT {
            
            /*
            //List<Contact> contact = [SELECT AccountId, Email FROM Contact WHERE AccountId IN :accountRecs.Id] ;
            for(Account accountRec: Trigger.new){
                List<Contact> contactRecs = [Select AccountId, Email From Contact WHERE AccountId =:accountRec.Id];
                system.debug(contactRecs);
                for(Contact contactRec: contactRecs){
                    accountRec.Email__c = contactRec.Email;
                }
                
            }
          
            */            
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