public class SchedulablePractice implements Schedulable{
    public void execute(SchedulableContext sc){
        Account acc = new Account(name='Schedule Test');
        insert acc;
        Task ts = new Task();
        ts.WhatId=acc.Id;
        ts.Subject='For Schedule test bro, do it';
            
        insert ts;
            }}