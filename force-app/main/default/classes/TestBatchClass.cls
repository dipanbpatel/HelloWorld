global class TestBatchClass implements Database.Batchable<sObject>
{
    public final String query;
    
    global TestBatchClass(String q)
    {
        query = q;
    }
    
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQuerylocator(query);
    }
    
    global void execute(Database.BatchableContext bc,List<sObject> scope)
    {
        for(sObject obj: scope)
        {
            obj.put('Job_Description__c','.Net, Salesforce');
        }
        
        update scope;
    }
    
    global void finish(Database.BatchableContext bc)
    {
        System.debug('Batch Processing done:- '+ bc.getJobId());
    }
}