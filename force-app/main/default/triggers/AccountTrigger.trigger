trigger AccountTrigger on Account (after insert, after update) {


    Switch on Trigger.OperationType {
        when BEFORE_INSERT {

        } 
        when BEFORE_UPDATE {
            
        }
        when BEFORE_DELETE {
            
        }
        when AFTER_INSERT {
            AccountTriggerHelper.afterInsertAccount(Trigger.new);
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