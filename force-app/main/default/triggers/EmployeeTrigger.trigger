trigger EmployeeTrigger on Employee__c (before insert, before update) {
    if(Trigger.isBefore && Trigger.isInsert){
        system.debug('It is before insert: '+Trigger.new[0].EmployeeNo__c);
        Trigger.new[0].EmployeeNo__c += 1;
    }
    if(Trigger.isBefore && Trigger.isUpdate){
        system.debug('It is before update: '+Trigger.new[0].EmployeeNo__c+ '  old: '+Trigger.old[0].EmployeeNo__c);
        Trigger.new[0].EmployeeNo__c += 1;
    }
}