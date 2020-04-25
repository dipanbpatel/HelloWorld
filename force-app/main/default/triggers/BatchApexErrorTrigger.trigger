trigger BatchApexErrorTrigger on BatchApexErrorEvent (after insert) {
    List<BatchLeadConvertErrors__c> errList = new List<BatchLeadConvertErrors__c>();
    for(BatchApexErrorEvent ev:Trigger.new)
    {
        BatchLeadConvertErrors__c err = new BatchLeadConvertErrors__c();
        err.AsyncApexJobId__c = ev.AsyncApexJobId;
        err.Records__c = ev.JobScope;
        err.StackTrace__c = ev.StackTrace;
        errList.add(err);
    }
    insert errList;
}