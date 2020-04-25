trigger triggerHandson on Position__c (before INSERT,after INSERT,before UPDATE,after UPDATE,before DELETE) {
    
    if(Trigger.isInsert )
    {
        if(Trigger.isBefore)
        {
            for(Position__C i : Trigger.new)
            {
                System.debug('New Name:- '+ i.Name);
            }
        }
        else if(Trigger.isAfter)
        {
            for(Position__C i : Trigger.new)
            {
                System.debug('Newly Created ID:- '+ i.ID);
            }
        }
    }
    else if(Trigger.isUpdate)
    {
        if(Trigger.isBefore)
        {
            for(Position__C i : Trigger.old)
            {
                System.debug('Old Name:- '+ i.Name);
            }
            for(Position__C i : Trigger.new)
            {
                if(i.Min_Salary__c != null)
                    i.Max_Pay__c = i.Min_Salary__c + 1000;
                else i.Max_Pay__c = 600000;
                
                System.debug('New Name:- '+ i.Name);
            }
        }
        else if(Trigger.isAfter)
        {
            for(Position__C i : Trigger.old)
            {
                System.debug('Updated old Name:- '+ i.Name);
            }
            for(Position__C i : Trigger.new)
            {
                System.debug('Updated new Name:- '+ i.Name);
            }
        }
    }
    else if(Trigger.isDelete)
    {
        if(Trigger.isBefore)
        {
            for(Position__C i : Trigger.old)
            {
                if(!i.Name.Endswith('1'))
                {
                     i.addError('You can\'t delete this record!');
                }
            }
        }
    }
    
}