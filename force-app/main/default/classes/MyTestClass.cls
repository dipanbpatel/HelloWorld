global class MyTestClass implements Schedulable{

    global void execute(SchedulableContext sc){
    
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime
                            FROM CronTrigger WHERE Id = :sc.getTriggerId()];
                            
        System.debug(ct.CronExpression);
        System.debug(ct.TimesTriggered);
        
        Position__c objPosition = [Select ID,Name from Position__c where ID = 'a00i000000Hb8yQ'];
        delete objPosition;
    }

}