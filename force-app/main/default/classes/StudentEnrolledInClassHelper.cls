public with sharing class StudentEnrolledInClassHelper {
    public static void studentEnrolledInClass(List<Student_Enrolled_In_Class__c> studentEnrolledObj){
        List<AggregateResult> results= [SELECT COUNT(Customer_Account__c) Students, Live_Class__c FROM Student_Enrolled_In_Class__c GROUP BY Live_Class__c];
        List<Live_Class__c> liveClasses = new List<Live_Class__c>();
        for(Student_Enrolled_In_Class__c StudentInClasses: studentEnrolledObj){

         
            for(AggregateResult result:results){
         
                   String lClass = String.valueOf(result.get('Live_Class__c'));
                Integer totalStudents = Integer.valueOf(result.get('Students'));
                liveclasses.add(new Live_Class__c(Id=lClass, Total_Students__c = totalStudents));
            }
           
        }

        update liveClasses;
    }
}
