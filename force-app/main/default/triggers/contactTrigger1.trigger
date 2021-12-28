trigger contactTrigger1 on Contact (after insert) {
    
    Switch on Trigger.OperationType {
        when BEFORE_INSERT {
            
        } 
        when BEFORE_UPDATE {
            
        }
        when BEFORE_DELETE {
            
        }
        when AFTER_INSERT {
            ContactTriggerHelper.contactTrigger(Trigger.new);
            
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