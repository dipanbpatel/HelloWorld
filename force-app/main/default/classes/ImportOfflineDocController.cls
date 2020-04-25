public with sharing class ImportOfflineDocController {

//private Apttus__APTS_Agreement__c agreement;

    public ImportOfflineDocController(){}    	
  public ImportOfflineDocController(ApexPages.StandardController stdController) { 
    
    //this.agreement = (Apttus__APTS_Agreement__c)stdController.getRecord();
    
  }
	@Auraenabled
	public static void processDocument(Id agreementId, Id documentId) {

		PageReference ref = Page.SessionId;
        String content = ref.getContent().toString();
        Integer s = content.indexOf('Start_Of_Session_Id') + 'Start_Of_Session_Id'.length(),
                e = content.indexOf('End_Of_Session_Id');
        String SessionId = content.substring(s, e);
        System.debug('SessionId-->'+SessionId.equalsIgnoreCase(UserInfo.getSessionId()));
        List<Id> docIds = new List<Id>{documentId};
        //String SessionId = UserInfo.getSessionID(); 
        String apiServerURL = System.Url.getSalesforceBaseUrl().toExternalForm() + '/services/Soap/u/44.0/' + UserInfo.getOrganizationId(); 
        Apttus.MergeWebService.enableAuthoring(agreementId, 'Read only', docIds, SessionId, apiServerURL); 
        
    }
    
    /*public PageReference finalize(){
    
    agreement.Apttus__Status_Category__c = 'In Authoring';
    agreement.Apttus__Status__c = 'Author Contract';
    
    update agreement;
    
    PageReference result = new ApexPages.StandardController(agreement).view();
    
    return result;
    
  }*/


}