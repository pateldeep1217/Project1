public class AccountTriggerHelper {
    public static void afterInsertAccount(List<Account> acList){
        Account registrantAccount = [SELECT Id, Name FROM Account WHERE Name = 'Registrants' LIMIT 1];
        system.debug('RegistrantAccount ' + registrantAccount);
        List<Contact> con = [SELECT Id, AccountId, FirstName, LastName From Contact WHERE AccountId =: registrantAccount.Id];
        system.debug(con);
        for(Account accountRec: acList){
            system.debug(accountRec);
            
            
            for(Contact conRec: con){
                if(accountRec.Name == conRec.FirstName + ' ' + conRec.LastName ){
                    conRec.AccountId = accountRec.Id;
                    system.debug( 'Contact Account Id' + conRec.AccountId);
                    system.debug('Account Id' + accountRec);
                }
            }     
        }
        update con;  
    }
}