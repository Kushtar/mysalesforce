public class SchedulePractice2 implements Schedulable{
    public void execute(SchedulableContext sc){
        
        UpdateAccounts mybatch = new UpdateAccounts();
        mybatch.startDate= Date.newInstance(2022, 07, 12);
        mybatch.endDate= Date.newInstance(2022, 07, 16);
		Database.executeBatch(mybatch, 100);        
        
        
    }
    
}