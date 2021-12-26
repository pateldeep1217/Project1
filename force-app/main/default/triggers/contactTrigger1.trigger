trigger contactTrigger1 on Contact (after insert) {
    
    Switch on Trigger.OperationType {
        when BEFORE_INSERT {
            
        } 
        when BEFORE_UPDATE {
            
        }
        when BEFORE_DELETE {
            
        }
        when AFTER_INSERT {
            List<Account> accountNew = new List<Account>();
            
            Account registrantAccount = [SELECT Id, Name FROM Account WHERE Name = 'Registrants'];
            
            for(Contact contactRec: Trigger.new){               

                if(contactRec.AccountId == registrantAccount.Id){
                    Account accountRec = new Account(Name = contactRec.FirstName + ' ' + contactRec.LastName); 
                    accountNew.add(accountRec);    
                }                    
                
            }
            
            insert accountNew;
            
         
            
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