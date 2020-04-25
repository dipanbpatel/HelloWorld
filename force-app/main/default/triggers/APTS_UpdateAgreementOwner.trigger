trigger APTS_UpdateAgreementOwner on Account (after update) {
    
    for( ID accountId : Trigger.newMap.keySet() )
    {
      if( Trigger.oldMap.get( accountId ).OwnerId != Trigger.newMap.get( accountId ).OwnerId )
      {
         // do something here because your field has changed
         List<Apttus__APTS_Agreement__c> agreementList = [select ID,OwnerId 
                                                            from Apttus__APTS_Agreement__c 
                                                            where (Apttus__Account__r.ID = :accountId or Apttus__Parent_Agreement__c = :accountId)
                                                            and OwnerId = :Trigger.oldMap.get( accountId ).OwnerId
                                                         ];
      
        if(agreementList.size() > 0)
        {
            for(Apttus__APTS_Agreement__c agree : agreementList)
            {
                agree.OwnerId = Trigger.newMap.get( accountId ).OwnerId;
            }
            update agreementList;
        }
      
      }
    }
}