trigger TaskTrigger on Task (after insert, after update) {
	
    switch on Trigger.operationType{
        when AFTER_INSERT{
            Set<Id> contactIds = new Set<Id>();
            for(Task t:Trigger.new){
          
                if(t.WhoId != null && String.valueOf(t.whoId).startsWith('003')){
                    contactIds.add(t.WhoId);
                }
            }
            
            //List<Contact> contacts = [SELECT Id, No_of_Open_Tasks__c FROM Contact WHERE Id in :contactIds];
            
            Map<Id,Contact> contactMap = new Map<Id,Contact>([SELECT Id, No_Of_Open_Tasks__c FROM Contact WHERE Id in :contactIds]);
            
            for(Task t:Trigger.new){
                if(contactMap.containsKey(t.WhoId)){
                    //contactMap.get(t.WhoId).No_Of_Open_Tasks__c += 1;
                    system.debug(contactMap.get(t.WhoId));
                }
            }
            //update contactMap.values();
        }
        when AFTER_UPDATE{
            
        }
    }
}