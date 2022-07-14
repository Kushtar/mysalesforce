public class IsSpam implements Database.Batchable<sObject>{
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('Select id, IsSpam__c from Case where IsSpam__c=true');        
    }
    
    public void execute(Database.BatchableContext bc, List<Case> records){
        List<Case> casesToDelete = new List<Case>();
        delete casesToDelete;
        
        update casesToDelete;
    }
    public void finish(Database.BatchableContext bc){}

}
/*
Below is the Anonymous Execution
IsSpam batch = new IsSpam();
Database.executeBatch(batch, 200);
 * */