public class SOQLClass1 {
	
    public static void myMethod(){
        /*
        List<Account> accList = [Select Name from Account];
        
        for(Integer i = 0; i<accList.size(); i++){
            system.debug(accList[i].Name);
        }
    	system.debug(accList);
        
        
        for(Account a:acclist){
            system.debug(a.Name);
        }
        */
        //SOQL Variable Binding
        String str = 'patel';
        List<Contact> conList = [Select firstName, lastName, email from Contact where lastName = :str];
        
        system.debug(conList);
    }
}