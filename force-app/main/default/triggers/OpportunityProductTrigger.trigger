trigger OpportunityProductTrigger on OpportunityLineItem (before insert) {
    Switch on Trigger.OperationType {
        when BEFORE_INSERT {
            
            OpportunityProductHelper.OpoortunityLineItem(Trigger.new);
			
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