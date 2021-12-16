public class LeadTriggerHelper {
    
    public static void leadName(List<Lead> leadRecs){
        for(Lead leadRec:leadRecs){
            
            if(leadRec.Individual__c == true){
                if(leadRec.firstName == null){
                    leadRec.FirstName.addError('First name Cannot be Blank');
                }
                if(leadRec.firstName != null){
                    leadRec.Company = leadRec.firstName + ' ' + leadRec.lastName;
                }
            }
        }
    }
    
    
    public static void leadStatus(List<Lead> oldLeadRecs, List<Lead> leadRecs){
        for(Lead oldLeadRec: oldLeadRecs){
            //check if status is not contacted
            if(oldLeadRec.Status == 'Open - Not Contacted'){
 
                for(Lead leadRec: leadRecs){
                    if(oldLeadRec.Id == leadRec.Id && (leadRec.Status == 'Closed - Not Converted' || leadRec.Status == 'Closed - Converted' )){
                        leadRec.Status.addError('Cannot Change directly to Closed - Not Converted or Converted');
                    }
                }
                
            }
            //if it is then prevent them if try to change not contacted to closed - Not conveted or converted
        }
    }
    
}