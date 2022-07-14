public class DeleteAccountDate implements Database.Batchable<sObject>{
    
    public Date startDate;
    public Date endDate;
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('Select id, CreatedDate from Account where createdDate>:startDate and createdDate<:endDate');        
    }
    
    public void execute(Database.BatchableContext bc, List<Account> records){
     
    delete records;
   
    }
    public void finish(Database.BatchableContext bc){}
    
}
/*
Below is the Anonymous Execution
DeleteAccountDate mybatch = new DeleteAccountDate();
mybatch.startDate=date.newInstance(2022, 01, 01);
mybatch.endDate = date.newInstance(2022, 05, 01);
Database.executeBatch(mybatch, 100);
*/