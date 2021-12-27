public with sharing class Product {
    
    @AuraEnabled(cacheable=true)
    public static List<PricebookEntry> getProduct(String searchKey){ 
       
        String key = '%'+'Javascript'+'%';
        key = '%' + searchKey+ '%';
       
        
    
        return[SELECT Product2.Name , Pricebook2.Name, Product2.Description, UnitPrice from PricebookEntry 
                WHERE pricebook2.Name = 'Standard Price Book' ];
    }




}
