public class newOpportunityController {
    
    Position__c position;
    
    public pagereference step2()
    {
        return Page.opptyStep2;
    }
    public pagereference step3()
    {
        return Page.opptyStep3;
    }
    public pagereference step1()
    {
        return Page.opptyStep1;
    }
    public pagereference step2_1()
    {
        return Page.opptyStep2_1;
    }
    public Position__c getPosition()
    {
        if(position==null)
            position = new Position__c();
        
        return position;
    }
}