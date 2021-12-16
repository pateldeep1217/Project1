trigger LeadTrigger on Lead (before insert,after insert, before update, after update) {
    Switch on Trigger.OperationType {
        when BEFORE_INSERT {
            LeadTriggerHelper.leadName(Trigger.new);
        } 
        when BEFORE_UPDATE {
            LeadTriggerHelper.leadName(Trigger.new);
            LeadTriggerHelper.leadStatus(Trigger.old, Trigger.new);
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