global class InactiveApplication implements Database.Batchable<sObject>
{
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        String query = 'Select Id, isNotif__c from Log__c where isNotif__c =false';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<log__c> scope)
    {       
        EmailTemplate emailTemplate = [select Id, Body from EmailTemplate where DeveloperName = 'Update_Service_Request'];
        
        for(log__c ta : (List<log__c>)scope) {
            Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
            
            message.toAddresses = new String[]{'zhkushtarbek@gmail.com'};
                message.plainTextBody = 'Logs not Checked';
            
            Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage>{message};
                
                Messaging.sendEmail(messages);
        }
    }  
    global void finish(Database.BatchableContext BC)
    {
    }
}