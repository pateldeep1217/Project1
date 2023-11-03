public with sharing class StudentEnrolledInClassHelper {
    public static void studentEnrolledInClass(List<Student_Enrolled_In_Class__c> studentEnrolledObj){
    Map<Id, Integer> classToStudentCount = new Map<Id, Integer>();
    
    for (AggregateResult result : [SELECT COUNT(Customer_Account__c) Students, Live_Class__c FROM Student_Enrolled_In_Class__c WHERE Live_Class__c IN :studentEnrolledObj GROUP BY Live_Class__c]) {
        Id liveClassId = (Id)result.get('Live_Class__c');
        Integer studentCount = (Integer)result.get('Students');
        classToStudentCount.put(liveClassId, studentCount);
    }

    List<Live_Class__c> liveClassesToUpdate = new List<Live_Class__c>();

    for (Student_Enrolled_In_Class__c studentEnrolled : studentEnrolledObj) {
        Id liveClassId = studentEnrolled.Live_Class__c;
        if (classToStudentCount.containsKey(liveClassId)) {
            Live_Class__c liveClass = new Live_Class__c(Id = liveClassId, Total_Students__c = classToStudentCount.get(liveClassId));
            liveClassesToUpdate.add(liveClass);
        }
    }

    update liveClassesToUpdate;
    }
}
