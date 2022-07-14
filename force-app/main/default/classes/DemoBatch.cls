public class DemoBatch implements Database.Batchable<sObject>{
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('Select id, Description from Account');        
    }
    
    public void execute(Database.BatchableContext bc, List<Account> records){
        List<Account> accountsToUpdate = new List<Account>();
        
        for(Account account:records){
            account.Description = 'New description from Kushtar';
            accountsToUpdate.add(account);
        }
        update accountsToUpdate;
    }
    public void finish(Database.BatchableContext bc){}

}