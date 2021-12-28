trigger StudentEnrolledInClassTrigger on Student_Enrolled_In_Class__c (after insert) {
    Switch on Trigger.OperationType {
        when BEFORE_INSERT {
            
        } 
        when BEFORE_UPDATE {
            
        }
        when BEFORE_DELETE {
            
        }
        when AFTER_INSERT {
            StudentEnrolledInClassHelper.studentEnrolledInClass(Trigger.new);
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