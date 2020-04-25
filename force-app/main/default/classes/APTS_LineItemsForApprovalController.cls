public with sharing class APTS_LineItemsForApprovalController {
        
    private ID agmtId = null;
    
    // line items to submit
    public Set<Id> lineItemIds {get; private set;}
    // start indicator
    public Boolean startSubmit {get; private set;}
    
    public APTS_LineItemsForApprovalController(ApexPages.StandardSetController stdSetController) {
        String agmtIdStr = ApexPages.currentPage().getParameters().get('id');
        system.debug('agmtIdStr::'+agmtIdStr);
        
        if (agmtIdStr != null) {
            agmtId = String.escapeSingleQuotes(agmtIdStr);
            System.debug('Agreement Id = '+agmtId);
            
                       
            Map<Id,Apttus__AgreementLineItem__c> agmtLineItems;
            
            agmtLineItems=new Map<Id,Apttus__AgreementLineItem__c> (
                    [select Id from Apttus__AgreementLineItem__c 
                            where Apttus__AgreementId__c = :agmtId ]); 
            
            
                        
            lineItemIds = agmtLineItems.keySet();
        }
        startSubmit = false;
    }
    
    public PageReference doStartSubmit() {
        startSubmit = true;
        return null;
    }
    public PageReference doCompleteSubmit() {
        system.debug('docompleted');
        
        PageReference pageRef = new PageReference('/' + agmtId);
        pageRef.setRedirect(true);
        return pageRef;
    }

    
}