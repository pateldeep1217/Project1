trigger StudentEnrolledInClassTrigger on Student_Enrolled_In_Class__c (after insert) {
    Switch on Trigger.OperationType {
        when BEFORE_INSERT {
            
        } 
        when BEFORE_UPDATE {
            
        }
        when BEFORE_DELETE {
            
        }
        when AFTER_INSERT {
            List<AggregateResult> results= [SELECT COUNT(Customer_Account__c) Students, Live_Class__c FROM Student_Enrolled_In_Class__c GROUP BY Live_Class__c];
            List<Live_Class__c> liveClasses = new List<Live_Class__c>();
            for(Student_Enrolled_In_Class__c StudentInClasses: Trigger.new){

             
                for(AggregateResult result:results){
             
                   	String lClass = String.valueOf(result.get('Live_Class__c'));
                    Integer totalStudents = Integer.valueOf(result.get('Students'));
                    liveclasses.add(new Live_Class__c(Id=lClass, Total_Students__c = totalStudents));
                }
               
            }

            update liveClasses;
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