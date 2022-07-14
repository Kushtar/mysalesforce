public class UpdateAccounts implements Database.Batchable<sObject>{
    
    public Date startDate;
    public Date endDate;
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('Select id, CreatedDate from Account where createdDate>:startDate and createdDate<:endDate');        
    }
    
    public void execute(Database.BatchableContext bc, List<Account> records){
        List<Account> temp = new List<Account>();
        List <Task> temptask = new List<Task>();
        for(account acc:records)   {
            acc.description='THis is batch scheduled for 2am';
            Task relatedTask = new Task();
            relatedTask.subject='THis is task scheduled for 2am';
            relatedTask.WhatId=acc.id;
            temp.add(acc);
            temptask.add(relatedTask);
            
        }
        update temp;
        insert temptask;
        
    }
    public void finish(Database.BatchableContext bc){}
    
}
/*
Below is the Anonymous Execution
UpdateAccounts mybatch = new UpdateAccounts();
mybatch.startDate=date.newInstance(2022, 07, 12);
mybatch.endDate = date.newInstance(2022, 07, 15);
Database.executeBatch(mybatch, 100);
*/