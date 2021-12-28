public with sharing class ContactTriggerHelper {
    public static void contactTrigger(List<Contact> contactObj){
        List<Account> accountNew = new List<Account>();
            
        Account registrantAccount = [SELECT Id, Name FROM Account WHERE Name = 'Registrants'];
        
        for(Contact contactRec: contactObj){               

            if(contactRec.AccountId == registrantAccount.Id){
                Account accountRec = new Account(Name = contactRec.FirstName + ' ' + contactRec.LastName); 
                accountNew.add(accountRec);    
            }                    
            
        }
        
        insert accountNew;
    }
}
