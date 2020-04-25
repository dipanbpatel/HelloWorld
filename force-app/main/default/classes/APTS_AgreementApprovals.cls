public with sharing class APTS_AgreementApprovals {

    public ApexPages.StandardSetController agreeApprovalRecordSet;
    public ApexPages.StandardSetController agreeLineItemRecordSet;
    private List<Id> listGroupIds {get; set;}
    private Id userid {get; set;}
    public Id reqID {get; set;}
    public String sortExpression {get;set;}
    public boolean doSort {get;set;}
    public APTS_AgreementApprovals (ApexPages.StandardSetController controller) {
        listGroupIds = getQueuesForUser(UserInfo.getUserId());
        userid = UserInfo.getUserId(); 
        doSort = false;   
        sortExpression = 'lastmodifieddate'; 
    }
    
     public ApexPages.StandardSetController getagreeApprovalRecordSet(){
            if(agreeApprovalRecordSet== null || doSort==true){ 
                List<sObject> listobj = Database.query(
                    'select a.Apttus_Approval__Related_Agreement__r.Name,a.Apttus_Approval__Assigned_To_Name__c,'+
                            'a.Apttus_Approval__Related_Agreement_Owner__r.Name,a.ID,a.Name,a.lastmodifieddate,'+
                                'a.Apttus_Approval__Related_Agreement__r.Apttus__Account__r.Id,a.Apttus_Approval__Related_Agreement__r.Apttus__Account__r.Name'+
                                'a.Apttus_Approval__ProcessInstanceId__r.Name,a.Apttus_Approval__Action__c'+
                                ' From Apttus_Approval__Approval_Request__c a '+
                                ' where  a.Apttus_Approval__Action__c !=null and a.Apttus_Approval__Active__c = true and (a.Apttus_Approval__Assigned_To_Id__c in :listGroupIds or a.Apttus_Approval__Assigned_To_Id__c = :userid)'+
                                ' and (a.Apttus_Approval__Related_Agreement__c != null or  Apttus_Approval__Parent_Agreement__c != null)'+
                                ' order by '+sortExpression
                );
            
              
            agreeApprovalRecordSet= new ApexPages.StandardSetController(listobj);
            //agreeApprovalRecordSet.setPageSize(10);
        }
        return agreeApprovalRecordSet;
    }
    public ApexPages.StandardSetController getagreeLineItemRecordSet(){
            if(agreeLineItemRecordSet== null || doSort==true){ 
            
            List<sObject> listobj = Database.query(
                'select a.Apttus_Approval__Related_Agreement__r.Name,a.Apttus_Approval__Assigned_To_Name__c,'+
                            'a.Apttus_Approval__AgreementLineItemId__r.Apttus__ProductId__r.Name,'+
                            'a.Apttus_Approval__AgreementLineItemId__r.Name,a.Apttus_Approval__Action__c,'+
                            'a.Apttus_Approval__AgreementLineItemId__r.Apttus__AgreementId__r.Owner.Name,a.ID,a.Name,a.lastmodifieddate,'+
                                'a.Apttus_Approval__Related_Agreement__r.Apttus__Related_Opportunity__r.Account.Name,'+
                                'a.Apttus_Approval__AgreementLineItemId__r.Apttus__AgreementId__r.Name,'+
                                'a.Apttus_Approval__AgreementLineItemId__r.Apttus__AgreementId__r.Id,'+
                                'a.Apttus_Approval__AgreementLineItemId__r.Apttus__AgreementId__r.Apttus__Account__r.Name,'+
                                'a.Apttus_Approval__AgreementLineItemId__r.Apttus__AgreementId__r.Apttus__Account__r.Id'+
                                ' From Apttus_Approval__Approval_Request__c a '+
                                ' where  a.Apttus_Approval__Action__c !=null and a.Apttus_Approval__Active__c = true and (a.Apttus_Approval__Assigned_To_Id__c in :listGroupIds or a.Apttus_Approval__Assigned_To_Id__c = :userid)'+
                                ' and (a.Apttus_Approval__AgreementLineItemId__c != null )'+
                                ' order by '+sortExpression
            );
            agreeLineItemRecordSet= new ApexPages.StandardSetController(listobj);
            //agreeLineItemRecordSet.setPageSize(10);
        }
        return agreeLineItemRecordSet;
    }
    public List<Apttus_Approval__Approval_Request__c> getagreeApprovalsPage()
    {
        List<Apttus_Approval__Approval_Request__c> agreeRequestRecords = new List<Apttus_Approval__Approval_Request__c>();
        if(getagreeApprovalRecordSet()!=null)
            agreeRequestRecords =  agreeApprovalRecordSet.getRecords();
        
        return agreeRequestRecords;
    }
    public List<Apttus_Approval__Approval_Request__c> getagreeLineItemApprovalsPage()
    {
        List<Apttus_Approval__Approval_Request__c> agreeLineItemRequestRecords = new List<Apttus_Approval__Approval_Request__c>();
        if(getagreeLineItemRecordSet()!=null)
            agreeLineItemRequestRecords =  agreeLineItemRecordSet.getRecords();
        
        return agreeLineItemRequestRecords ;
    }
    public PageReference sortView()
    {
        return null;
    }
    public PageReference goTo()
    {
        return new PageReference('/'+reqID );       
    }
    private List<Id> getQueuesForUser(String userId) {
        List<Id> listGroupIds = new List<Id>();
        List<GroupMember> listGroupMembers = [Select g.GroupId From GroupMember g
                                                where g.Group.Type='Queue'
                                                and g.UserOrGroupId=:userId
                                                ];                                                 
        if (listGroupMembers!=null && listGroupMembers.size()>0) {     
            for (GroupMember gm:listGroupMembers) {
                listGroupIds.add(gm.GroupId);
            }
        }
         
        return listGroupIds;
    }     
}