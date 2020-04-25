Public class createProposalController{

    public createProposalController(ApexPages.StandardController std){
    }
    public Pagereference onLoad(){
        Apttus_Proposal__Proposal__c prop = new Apttus_Proposal__Proposal__c(Apttus_Proposal__Proposal_Name__c='Test12345');
        insert prop;
        return new Pagereference('/'+prop.Id);
    }

}