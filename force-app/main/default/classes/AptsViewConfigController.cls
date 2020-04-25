/**
 *  Apttus Config & Pricing
 *  AptsViewConfigController
 *  - Handles customized version of view config page.
 *
 *  Copyright (c) 2012 BMC Software Inc.
 *
 *  Modication History:
 *  [02/23/2012 - James (Apttus) - Initial development]
 *  [09/11/2012] - Shabbir (Apttus) - Update for Target ACV Validation
 *
 */
public with sharing class AptsViewConfigController {
    public Boolean inDebug {get; private set;}

    // is migration flag
    public Boolean inMigration {get; private set;}

    // is MSM - Gold-Green-Blue to Blue
    public Boolean isMSMGGB2B {get; private set;}

    // is Blue to Blue
    public Boolean isB2B {get; private set;}
    // is Green/Gold to Blue
    public Boolean isGG2B {get; private set;}

    public Boolean isModelBlue {get; private set;}

    public Boolean isModelSaaS {get; private set;}

    public Boolean isModelGold {get; private set;}

    public Boolean isPartnerDeal {get; private set;}

    public Boolean isModelGreen {get; private set;}

    //CO3941
    public Decimal miscBasePrice {get; private set;}

    // cart has system auto added prereq product(s)
    public Boolean hasPrereq {get; private set;}

    public Boolean canEditSupportAdjusts {get; private set;}
    
    public boolean isGoalSeekRecursive {get; private set;}
    
    public boolean isSupportCreditHigher {get; private set;}
    
    public boolean isPriceOverrideMigAllError {get; private set;}
    public boolean isDiscountPercentMigAllError {get; private set;}
    public String MSMMigAllErrorMessage {get; private set;}
    public Boolean hasMultipleGoalSeek {get; private set;}
    public Integer numberOfGoalSeekDiscounts {get; private set;}
    
    // product id-family map
    private Map<ID, String> prodFamilyMap = new Map<ID, String>();
    private Map<Id, String> prodIdRelatedProdCode = new Map<Id, String>();
    private static final String PROD_FAMILY_IDM = 'IDM';
    private static final String PROD_FAMILY_APM = 'APM';
    private static final String PROD_FAMILY_IDENTIFY = 'Identify';
    private static final String PROD_FAMILY_TMART = 'TMart';

    private boolean hasSpecialAdjustmentPrivilege = false;
    //DE1645
    private boolean canEditLicenseSupport = false;
    //CO3842:  to determine whether we are coming from Which place
    private String sourcePage = null;
    
    private boolean isOnLoadApplyAllAdjustment = false;

    // base view controller
    public Apttus_Config2.ViewConfigController baseController {get; set;}

    // config request id
    private String cfgRequestId = null;

    private Apttus_Config2__ProductConfiguration__c configSO;
    public Apttus_Proposal__Proposal__c proposalSO {get; private set;}
    

    // Migration Threshold calculation
        // channel discount
        // asset run rate
        // net support price
        // (BMC_Annual_Support_Fee__c + (BMC_Annual_Support_Fee__c * Channel_Discount__c)) / BMC_Migrated_Asset_Run_Rate__c , null)
    private Decimal channelDiscount = 0;
    private Decimal oldRunRate = 0;
    private Decimal newRunRate = 0;
    private Decimal supportCredit = 0;

    
    // Adjustment Type Lis
    public List<SelectOption> adjustmentTypeOptions {get; private set;}
    public List<SelectOption> supportAdjustmentTypeOptions {get; private set;}
    /**
     * Class Constructor specifying initial values
     * @param stdController the standard controller
     */
    public AptsViewConfigController(ApexPages.StandardController stdController) {
        inDebug = true;

        hasPrereq = false;
        
        // config request id
        System.debug('***** ApexPages.currentPage().getParameters():'+ApexPages.currentPage().getParameters());
        String cfgRequestIdStr = ApexPages.currentPage().getParameters().get(AptsCPQConstants.PARAM_CONFIG_REQUEST_ID);
        sourcePage = ApexPages.currentPage().getParameters().get(AptsCPQConstants.PARAM_PREVIOUS_ACTION);

        // instantiate managed base controller
        baseController = new Apttus_Config2.ViewConfigController(stdController);
        configSO = (Apttus_Config2__ProductConfiguration__c) stdController.getRecord();

                // check proposal
        List<Apttus_Proposal__Proposal__c> proposalList = [select Id
                    from Apttus_Proposal__Proposal__c
                                                    where Id = :configSO.Apttus_Config2__BusinessObjectId__c];
        

    }
    public PageReference applyAllAdjustments() {
         
              // apply base adjustments
        PageReference rtnPageRef;
            rtnPageRef = baseController.doApplyAdjustments();

            system.debug('Return page : '+ rtnPageRef);
            //Temp addition
            
            rtnPageRef = baseController.doApplyAdjustments();
            system.debug('Return page 2: '+ rtnPageRef);
        return rtnPageRef;

    }
    /**
     * Invoke base doLoad and check and update prerequisites info
     */
    public PageReference doLoadItems() {
        PageReference returnPage = null;
        //skip constraint rules 
        ApexPages.currentPage().getParameters().put('SKIP_CONSTRAINT_CHECK', 'true');
        ApexPages.currentPage().getParameters().put('SKIP_CONSTRAINT_UPDATE', 'true');
        
        //addMiscLineItems();  //SHABBIR 23/9/2013  //SHABBIR 25/9/2013 Uncommented
        
        baseController.doLoad();          
        return returnPage;
    }
    
 }