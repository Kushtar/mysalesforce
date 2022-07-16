trigger crCon on Contact (before update) {

    for (Contact con:Trigger.new){
        Contact oldContact=Trigger.OldMap.get(con.Id);//Storing older version into opportunity.
        String oldEmail=oldContact.Email;
        
        if(con.email!=oldEmail){
           Boolean result = Email.send(con.email, 'Trigger test: your email has been changed to '+con.email);
           if (!result){
                con.addError('Email not sent');
           }
        }

    }
}