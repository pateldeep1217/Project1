trigger StudentEnrolledInClassTrigger on Student_Enrolled_In_Class__c (after insert) {
    Switch on Trigger.OperationType {
        when BEFORE_INSERT {
            
        } 
        when BEFORE_UPDATE {
            
        }
        when BEFORE_DELETE {
            
        }
        when AFTER_INSERT {
            for(Student_Enrolled_In_Class__c StudentInClasses: Trigger.new){
                String liveClass = StudentInClasses.Live_Class__c;
                system.debug('Live Class ID - ' + liveClass);
                List<AggregateResult> results= [SELECT COUNT(Customer_Account__c) Students, Live_Class__c FROM Student_Enrolled_In_Class__c GROUP BY Live_Class__c];
             
                for(AggregateResult result:results){
             
                   	String lClass = String.valueOf(result.get('Live_Class__c'));
                    Integer totalStudents = Integer.valueOf(result.get('Students'));
                    Live_Class__c liClass = new Live_Class__c(Id=lClass, Total_Students__c = totalStudents);
                    update liClass;
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