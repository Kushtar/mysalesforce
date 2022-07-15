trigger crCon on Contact (before update) {

    for (Contact con:Trigger.new)
{
Contact tempcon=Trigger.OldMap.get(con.Id);//Storing older version into opportunity.
String oldemail=tempcon.email;
if(con.email!=oldemail)
{
//    EmailTemplate emailTemplate = [select Id, Body from EmailTemplate where DeveloperName = 'Update_Service_Request'];
Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        
        message.toAddresses = new String[]{con.email};
            message.plainTextBody = 'your new email is '+ con.email;
        
        Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage>{message};
            
            Messaging.sendEmail(messages);

}



    
    

}}