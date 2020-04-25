/**
 *  Apttus Config & Pricing
 *  AptsCPQConstants
 *  - Constants to be shared across apex code base
 *      
 *  Copyright (c) 2012 BMC Software Inc.
 *
 *  Modication History:
 *  [06/23/2012 - James (Apttus) - Initial development]
 *
 */
public abstract class AptsCPQConstants {

    // single quote
    public static final String SQ = '\'';
    
    public static final String CONTRACT_TYPE_EXIS_MASTER_AGR_OTHER = 'Existing Master Agreement/Other';
    public static final String OTHER_AGR_ERROR_MSG = 'You must enter a value';
    public static final String CONTRACT_TYPE_OTHER_AGR_ERROR_MSG = 'Contract Type should be '
            + CONTRACT_TYPE_EXIS_MASTER_AGR_OTHER + ' for entering Other Agreement information.';
    
    // webservice call failure
    public static final String AUDIT_SYSTEM_ERROR = 'System Error';
    
    // config request id, from biz type, from biz title params
    public static final String PARAM_ACTION = 'action';
    public static final String PARAM_CONFIG_REQUEST_ID = 'configRequestId';
    public static final String PARAM_FROM_BIZ_TYPE = 'fromBizType';
    public static final String PARAM_FROM_BIZ_TITLE = 'fromBizTitle';
    public static final String PARAM_PREVIOUS_ACTION = 'previousAction';
    public static final String PARAM_VALUE_REPRICE = 'Reprice';
    public static final String PARAM_DETAIL_CALLERPAGE = 'detailCallerPage';
    
    // input request parameter name
    public static final String PARAM_OPPORTUNITY_ID = 'opportunityId';
    public static final String PARAM_PROPOSAL_ID = 'proposalId';
    public static final String PARAM_RETURN_ID = 'retId';
    
    // action generate support line items
    public static final String ACTION_GENERATE_SUPPORT_LINEITEMS = 'generateSupportLineItems';
    public static final String ACTION_REPRICE_LINEITEMS = 'repriceLineItems';
    
    // allowed cart actions
    public static final String ALLOWABLE_ACTION_NO_ADJUSTMENTS = 'No Adjustments';
    
    // action 'Cancel'
    public static final String ACTION_CANCEL = 'Cancel';
    // action 'Split'
    public static final String ACTION_SPLIT = 'Split';
    
    // statuses accross objects    
    public static final String STATUS_PENDING = 'Pending';
    public static final String STATUS_COMPLETE = 'Complete';
    public static final String STATUS_FINALIZED = 'Finalized';
    public static final String STATUS_NEW = 'New';
    public static final String STATUS_NA = 'NA';
    public static final String STATUS_SUPERSEDED = 'Superseded';
    
    public static final String STATUS_GA = 'GA';    
    public static final String STATUS_WITHDRAWN = 'WITHDRAWN';
    public static final String STATUS_ACTIVE = 'ACTIVE';
    public static final String STATUS_INACTIVE = 'INACTIVE';
    public static final String STATUS_NOMAINT = 'NOMAINT'; 
    public static final String STATUS_CONTROLLED = 'CONTROLLED'; 
    
    public static final String STATUS_WITHDRAWN_LABEL = 'Withdrawn';
    public static final String STATUS_ACTIVE_LABEL = 'Active';
    public static final String STATUS_NOMAINT_LABEL = 'No Maint';
    
    // uom - per enterprice
    public static final String UOM_PER_ENTERPRISE = 'per enterprice';
    
    // partner related support tier (prefix)
    public static final String PARTNER_PREFIX = 'Partner';
    
    // category
    public static final String CATEGORY_QUOTE_OR_PROPOSAL = 'Proposal';
    
    // bmc continuous support
    public static final String BMC_CONTINUOUS_SUPPORT_CODE = 'C2' ;
    public static final String BMC_CONTINUOUS_SUPPORT_CODE_G3 = 'G3' ;
    // bmc fast track support
    public static final String BMC_FASTRACK_SUPPORT_CODE = 'C1' ;
    public static final String BMC_FASTRACK_SUPPORT_CODE_2 = 'G2' ;    
    
    //Partner Fast - track Support //Anand CO3839
    public static final Set<String> PARTNER_FASTRACK_SUPPORT_CODE = new Set<String>{'C1','G1','G2','C4','C6','C8','C10','G4','G9','G15'};
        
    // revenue type codeS
    public static final String REV_TYPE_CODE_PERPETUAL = 'PERPETUAL';
    public static final String REV_TYPE_CODE_ESM_ON_DEMANED = 'ESM ON DEMAND';
    
    // lineitem type Product/Service
    public static final String LINE_TYPE_PRODUCT_OR_SERVICE = 'Product/Service';
        
    // summary group types
    public static final String GROUPTYPE_PRODUCT = 'Product';
        
    // record types
    public static final String REC_TYPE_PERPETUAL_QUOTE = 'Perpetual Quote';
    public static final String REC_TYPE_TERM_QUOTE = 'Term Quote';
    public static final String REC_TYPE_SAAS_QUOTE = 'SaaS';

    // sobject type
    public static final String SOBJECT_TYPE_PROPOSAL = 'Apttus_Proposal__Proposal__c';
       
    // business unit
    public static final String BU_MSM = 'MSM';
    public static final String BU_ESM = 'ESM';
    public static final String BU_SAAS = 'SAAS';    
    public static final String BU_BMC = 'BMC';    
    
    //product marketing schedule types
    public static final String MS_TYPE_EDUCATION_SERVICE = 'Education Service';
    public static final string MS_TYPE_PROFESSIONAL_SERVICE = 'Professional Service';
    public static final string MS_TYPE_PREMIER_SUPPORT = 'Premier Support';
    public static final string MS_TYPE_HARDWARE_PRODUCT = 'Hardware Product';
    public static final string MS_TYPE_SaaS_SUBSCRIPTION = 'SaaS Subscription';
    public static final string MS_TYPE_SaaS_SERVICE = 'SaaS Service';
    public static final string MS_TYPE_SaaS_HOSTINGSERVICE = 'Hosting Service';
    
    //License Types
    public static final String LICENSE_TYPE_FIXED = 'Fixed';
    public static final String LICENSE_TYPE_FLEXIBLE = 'Flexible'; 


    public static final String SUPPORT_TYPE_BMC = 'BMC Support';
    public static final String SUPPORT_TYPE_L0 = 'L0 Support';
    public static final String SUPPORT_TYPE_L1 = 'L1 Support';
    public static final Decimal SUPPORT_RESELLER_DISCOUNT_PERCENT = 5.0;
    public static final Decimal SUPPORT_LPC_DISCOUNT_PERCENT = 10.0;

    
    // charge types
    public static final String CHARGE_TYPE_LICENSE_PRICE = 'License Price';
    public static final String CHARGE_TYPE_SUPPORT_PRICE = 'Support Price';
    public static final String CHARGE_TYPE_SERVICE_PRICE = 'Service Price';
    public static final String CHARGE_TYPE_EXISTING_RUN_RATE = 'Existing Run-rate';
    public static final String CHARGE_TYPE_MIGRATION_ALLOWANCE = 'Migration Allowance';
    public static final String CHARGE_TYPE_HOSTING_PRICE = 'Hosting Price';
    public static final String CHARGE_TYPE_ADJUSTMENT = 'Adjustment';
    
    // license models
    public static final String LICENSE_MODEL_BLUE = 'Blue';
    public static final String LICENSE_MODEL_GREEN = 'Green';
    public static final String LICENSE_MODEL_GOLD = 'Gold';
    public static final String LICENSE_MODEL_SAAS = 'SaaS';
    
    // migration types
    public static final String MIGRATION_TYPE_GG2B = 'Green-Gold to Blue';
    public static final String MIGRATION_TYPE_B2B = 'Blue to Blue';
    public static final String MIGRATION_TYPE_GB2SAAS = 'Green-Blue to SaaS';
    public static final String MIGRATION_TYPE_GGB2B = 'Green-Gold-Blue to Blue';
    
    //CO3852:
    public static final String MIGRATION_TYPE_DSGG2B = 'Distributed Systems Green/Gold to Blue';
    public static final String MIGRATION_TYPE_DSB2B = 'Distributed Systems Blue to Blue';
    public static final String MIGRATION_TYPE_MF2B = 'Mainframe to Blue';
    public static final String MIGRATION_TYPE_DS2SAAS = 'Distributed Systems to SaaS';
    public static final String MIGRATION_TYPE_SAAS2SAAS = 'SaaS to SaaS';
    
    // migration group-0 mapping
    public static final String MIGRATION_GROUP_ZERO = 'Group_0';    
    // migration action
    public static final String MIGRATE = 'Migrate';
    public static final String KEEP = 'Keep';
    public static final String CANCEL = 'Cancel';
    public static final String SPLIT = 'Split';
    
    // credit calculation types
    public static final String CREDIT_CAL_TYPE_COMPONENT_BASED = 'Components Based';
    public static final String CREDIT_CAL_TYPE_CONVERTED_QTY_BASED = 'Converted Quantity Based';
    public static final String CREDIT_CAL_TYPE_ORIGINAL_QTY_BASED = 'Original Quantity Based';
    public static final String CREDIT_CAL_TYPE_DISTINCT_COMBO = 'Sum of Distinct Combo';

    // adjustment types
    public static final String ADJ_TYPE_PERCENT_DISCOUNT = '% Discount';
    public static final String ADJ_TYPE_DISCOUNT_AMOUNT = 'Discount Amount';
    public static final String ADJ_TYPE_MARKUP_AMOUNT = 'Markup Amount';
    public static final String ADJ_TYPE_PERCENT_MARKUP = '% Markup';
    public static final String ADJ_TYPE_PRICE_OVERRIDE = 'Price Override';
    
    // discount types
    public static final String DISCOUNT_TYPE_PARTNER_INCENTIVE = 'Partner Incentive Discount';
    public static final String DISCOUNT_TYPE_MIGRATION_ALLOWANCE = 'Migration Allowance';
    public static final String DISCOUNT_TYPE_EXISTING_RUN_RATE = 'Existing Run-rate';
    public static final String DISCOUNT_TYPE_ESP = 'ESP Discount';
    public static final String DISCOUNT_TYPE_EDUCATION = 'Education Discount';
    public static final String DISCOUNT_TYPE_NON_STANDARD = 'Non Standard Discount';
    public static final String DISCOUNT_TYPE_CHANNEL = 'Channel Discount';
    public static final String DISCOUNT_TYPE_DOR = 'Discount of Record';
    public static final String DISCOUNT_TYPE_LICENSE_SUPPORT = 'License/Support Discount';
    public static final String DISCOUNT_TYPE_RESELLER_SUPPORT = 'Reseller Support Discount' ;
    public static final String DISCOUNT_TYPE_LPC_SUPPORT = 'LPC Discount' ;
    public static final String DISCOUNT_TYPE_PROMOTIONAL = 'Promotional Discount';

    // CO4089 - Partner discount types
    public static final Set<String> PARTNER_DISCOUNT_TYPES_SET = new Set<String>{DISCOUNT_TYPE_PARTNER_INCENTIVE, DISCOUNT_TYPE_CHANNEL,
            DISCOUNT_TYPE_RESELLER_SUPPORT, DISCOUNT_TYPE_LPC_SUPPORT};
    
    // adjustment applies to
    public static final String ADJ_APPLIES_TO_START_PRICE = 'Starting Price';
    public static final String ADJ_APPLIES_TO_PREV_PRICE = 'Previous Price';

    // price methods
    public static final String PRICE_METHOD_PER_UNIT = 'Per Unit';
    public static final String PRICE_METHOD_FLAT_PRICE = 'Flat Price';
    
    // price types
    public static final String PRICE_TYPE_ONE_TIME = 'One Time';
    
    public static final String SELLING_FREQUENCY_ONE_TIME = 'One Time';
    public static final String SELLING_FREQUENCY_YEARLY = 'Yearly';
    public static final String SELLING_FREQUENCY_MONTHLY = 'Monthly';
    
    // MIPS protocol-classification name starts with
    public static final String MIPS_PP_CLASS_NAME = 'MIPS-T';
    public static final String CLASSIFICATION_CODE_TIER_110 = 'T110';
    public static final String MIPS_PP_CODE = 'MIPS';
    public static final String CLASSIFICATION_CODE_T = 'T';
    public static final Integer CLASSIFICATION_CODE_110 = 110;
    
    //Summary Group Line Types
    public static final String LINETYPE_SUBTOTAL = 'Subtotal';
    public static final String LINETYPE_GROUPTOTAL = 'Group Total';
    
    // lineitem types
    public static final String LINETYPE_PRODUCT = 'Product/Service';
    public static final String LINETYPE_OPTION = 'Option';
    public static final String LINETYPE_MISC = 'Misc';
    public static final String LINETYPE_ASSET = 'Asset';

    // lineitem statuses
    public static final String LINESTATUS_NEW = 'New';
    public static final String LINESTATUS_FINALIZED = 'Finalized';
    public static final String LINESTATUS_EXISTING = 'Existing';
    public static final String LINESTATUS_AMENDED = 'Amended';
    public static final String LINESTATUS_RENEWED = 'Renewed';
    public static final String LINESTATUS_CANCELLED = 'Cancelled';
    public static final String LINESTATUS_INCREMENTED = 'Incremented';
    public static final String LINESTATUS_MIGRATION = 'Migration';
    public static final String LINESTATUS_MISCELLENEOUS = 'Miscellaneous';
    
    // constraint rule action intent - to identify prereqs auto-added by the system
    public static final String ACTION_INTENT_AUTO_INCLUDE = 'Auto Include';
    
    // summary line types
    public static final String SUMMARY_LINESTATUS_TOTAL = 'Total';
    
    // product config statuses
    public static final String PRODCONFIG_STATUS_FINALIZED = 'Finalized';
    
    //Line of Business types
    public static final string LINEOFBUSINESS_SAs = 'SAs';
    public static final string LINEOFBUSINESS_SAu = 'SAu';
    public static final string LINEOFBUSINESS_SSu = 'SSu';
    public static final string LINEOFBUSINESS_MSM = 'MSM';
    public static final string LINEOFBUSINESS_SUB = 'SUB';
    public static final string LINEOFBUSINESS_SRV = 'SRV';
    public static final string LINEOFBUSINESS_SAAS = 'SAAS';
    //Non Standard Maintenance picklist values
    public static final string NONSTDMAINTENANCE_INCREASE = 'Increase';
    public static final string NONSTDMAINTENANCE_DECREASE = 'Decrease'; 
    //Product types
    public static final string PRODUCT_CONTROLLED = 'CONTROLLED';
    public static final string PRODUCT_WITHDRAWN = 'WITHDRAWN';
    
    //Product Platform Type
    public static final string PLATFORMTYPE_HARDWARE = 'HARDWARE';
    
    //Opportunity Stage Name
    public static final string OPPORTUNITY_STAGE = 'Closed No-Sale%';
    
    //approval email related
    public static final string APPROVALSTEP_BLUETERMDEAL = 'Blue Term Deals - (Group 1)';
    public static final string APPROVALSTEP_COMIGLEDDEAL = 'Comingled Deal - (Group 1)';    
    public static final string APPROVALSTEP_FASTTRACKSUPPORT = 'Fast Track Support - (Group 2)';
    public static final string APPROVALSTEP_LICENSESALES = 'Term Less Than 1 Year - (Group 1)';
    public static final string APPROVALSTEP_PARTNERDELIVEREDSUPPORT = 'Partner Delievered Support - (Group 2)';
    public static final string APPROVALSTEP_DISCAPPROVAL = 'Discount';
    public static final string APPROVALSTEP_SPECIALBIDMIG = 'Special Bid Migration - (Group 3)';
    public static final string APPROVALSTEP_SPECIALBIDPREMIERSUPPORT = 'Special Bid Premier Support - (Group 2)';
    public static final string APPROVALSTEP_PERPTOTERMCONVERT = 'Perp-to-Term Migrations';
    public static final string APPROVALSTEP_PROFSVCANDEDUCATION_DISC = 'Professional Services and Education - Discount > 15%';
    public static final string APPROVALSTEP_NONSTDMAINTENANCERATES = 'Std Maint/Lic Rate';
    public static final string APPROVALSTEP_WWGREENGOLD = 'New Green Licenses - (Group 1)';
    
    //Approval status values
    public static final string APPROVALSTATUS_APPROVED = 'Approved';
    public static final string APPROVALSTATUS_ASSIGNED = 'Assigned';
    public static final string APPROVALSTATUS_PENDINGAPPROVAL = 'Pending Approval';
    
    //Approval Stage values
    public static final String APPROVALSTAGE_SUBMITTED_FOR_BOOKING = 'Submitted for Booking';
    public static final String APPROVALSTAGE_SUBMIT_TO_SOS = 'Submit To SOS';

    //Approved Group
    public static final string APPROVEDGROUP0_NAME = 'Group 0';
    public static final string APPROVEDGROUP1_NAME = 'Group 1';
    public static final string APPROVEDGROUP2_NAME = 'Group 2';
    public static final string APPROVEDGROUP3_NAME = 'Group 3';
    public static final string APPROVEDGROUP4_NAME = 'Group 4';
    public static final String APPROVEDGROUPSM_NAME = 'Sales Manager Approval (Group 0)';
    public static final String APPROVEDGROUPBP_NAME = 'Local Best Practice Manager Approval (Group 0)';
    
    // Protocol and Subsegments
    public static final string ESM_ON_DEMAND_SERVICES_PROTOCOL = 'ESM ON DEMAND SERVICES';
    public static final string ESM_ON_DEMAND_PROTOCOL = 'ESM ON DEMAND';
    public static final string ESM_ON_DEMAND_OTHER_PROTOCOL = 'ESM ON DEMAND OTHER';
    public static final string ESM_ON_DEMAND_2_PROTOCOL = 'ESM ON DEMAND 2';
    public static final string ESM_ON_DEMAND_OTHER_2_PROTOCOL = 'ESM ON DEMAND OTHER 2';
    public static final string MDM_SUBSEGMENT = 'MDM On Demand' ; //'MDM'
    public static final string MDM_PASS_THROUGH_SUBSEGMENT = 'MDM On Demand Pass-through' ; //'MDM Pass-through';
    public static final string EUEM_AS_A_SERVICE_SUBSEGMENT = 'EUEM as a Service-ACT';
    public static final string PRICE_PROTOCOL_MF_ADVANTAGE = 'MF ADVANTAGE';
    
    //Quote Approval Stages
    public static final string QUOTEAPPROVALSTAGE_APPROVED ='Approved';
    public static final string QUOTEAPPROVALSTAGE_GENERATED ='Generated';
    public static final string QUOTEAPPROVALSTAGE_PRESENTED ='Presented'; 
    public static final string QUOTEAPPROVALSTAGE_ACCEPTED ='Accepted'; 
    public static final string QUOTEAPPROVALSTAGE_SUBMITTOSOS ='Submit To SOS';
    public static final string QUOTEAPPROVALSTAGE_SUBMITFORBOOKING ='Submitted for Booking';
    public static final string QUOTEAPPROVALSTAGE_PREREQAPPROVED ='Pre-req Approved';
    
    //Sector Name
    public static final String SECTORNAME_PUBLIC = 'Public';
    public static final String SECTORNAME_PRIVATE = 'Private';
    
    //Target ACV Types
    public static final String TARGET_ACV_TYPE_NET_PRICE = 'Net Price';
    public static final String TARGET_ACV_TYPE_PER_USER = 'Per User';
    
    //CO3958 - 
    public static final String DEAL_ACV = 'Deal';
    public static final String BOTH_ACV = 'Both';
    
    // Profiles that can edit support line adjustments
    public static final String PROFILE_BMC_SOS = 'BMC SOS';
    public static final String PROFILE_BMC_BEST_PRACTICES = 'BMC Best Practices';
    public static final String PROFILE_BMC_REV_REC = 'BMC Revenue Recognition';
    public static final String PROFILE_SYS_ADMIN = 'System Administrator';
    
    
    public static final String REMEDYFORCE_SERVICE_DESK_PRODUCT_CODE = 'LPSKW.0.0.00';
    public static final String REMEDY_ON_DEMAND_TARGET_ACV_GROUP = 'BMC Remedy OnDemand';
    public static final String REMEDYFORCE_SERVICE_DESK_TARGET_ACV_GROUP = 'BMC Remedyforce Service Desk';
    public static final String EUE_TARGET_ACV_GROUP = 'EUE';
    public static final String REMEDY_TARGET_ACV_GROUP = 'Remedy';
    public static final String MOBILITY_TARGET_ACV_GROUP = 'Mobility';
    
    public static final String LICENSE_TERRITORY_WORLDWIDE = 'Worldwide-NA';
    public static final String LICENSE_TERRITORY_WORLDWIDE_EMEA = 'Worldwide-EMEA';
    public static final String LICENSE_TERRITORY_WORLDWIDE_AP = 'Worldwide-AP';
    
    public static final String LANGUAGE_ENGLISH = 'English';
    public static final String LANGUAGE_GERMAN = 'German';
    public static final String LANGUAGE_SPANISH = 'Spanish';
    public static final String LANGUAGE_CHINESE = 'Chinese (Simplified)';
    public static final String LANGUAGE_FRENCH = 'French';
    public static final String LANGUAGE_ITALIAN = 'Italian';
    public static final String LANGUAGE_JAPANESE = 'Japanese';
    public static final String LANGUAGE_KOREAN = 'Korean';
    public static final String LANGUAGE_PORTUGUESE = 'Portuguese';
    public static final String LANGUAGE_PORTU_BRAZIL = 'Portuguese (Brazilian)';
    public static final String LANGUAGE_SPANISH_SPANISH = 'Spanish (Mexican)';
        
    public static Integer MAX_ALLOWED_LICENSE_TERRITORIES = 5;
    //Asset status
    public static final String STATUS_ASSET_FREE_SUPPORT = 'FREE SUPPORT';
    public static final String STATUS_ASSET_FREEZE = 'FREEZE';
    public static final String STATUS_ASSET_LITIGATION = 'LITIGATION';
    public static final String STATUS_ASSET_NOMAINT = 'NOMAINT';
    public static final String STATUS_ASSET_NONRENEWAL = 'NONRENEWAL';
    public static final String STATUS_ASSET_SCHD_P2T_SA_BL = 'SCHD P2T SA BL';
    public static final String STATUS_ASSET_SCH_NOMNTCANCEL = 'SCH_NOMNTCANCEL';
    public static final String STATUS_ASSET_SHELF = 'SHELF';
    public static final String STATUS_ASSET_WITHDRAWN = 'WITHDRAWN';
    public static final String STATUS_ASSET_SAAS_SCHDFREEZE = 'SAAS_SCHDFREEZE';
    public static final String STATUS_ASSET_WEB_BASED = 'WEB BASED';
    public static final String STATUS_ASSET_THIRDPARTY = 'THIRDPARTY';
    public static final String STATUS_ASSET_ACTIVE = 'ACTIVE';
    public static final String STATUS_ASSET_TLA = 'TLA';
    public static final String STATUS_ASSET_TERM = 'TERM';
    public static final String STATUS_ASSET_TERM_SCHDCANCEL = 'TERM_SCHDCANCEL';
    
    public static final String STATUS_ASSET_FREE_SUPPORT_LABEL = 'FREE SUPPORT';
    public static final String STATUS_ASSET_FREEZE_LABEL = 'FREEZE';
    public static final String STATUS_ASSET_LITIGATION_LABEL = 'LITIGATION';
    public static final String STATUS_ASSET_NOMAINT_LABEL = 'NOMAINT';
    public static final String STATUS_ASSET_NONRENEWAL_LABEL = 'NONRENEWAL';
    public static final String STATUS_ASSET_SCHD_P2T_SA_BL_LABEL = 'SCHD P2T SA BL';
    public static final String STATUS_ASSET_SCH_NOMNTCANCEL_LABEL = 'SCH NOMNTCANCEL';
    public static final String STATUS_ASSET_SHELF_LABEL = 'SHELF';
    public static final String STATUS_ASSET_WITHDRAWN_LABEL = 'WITHDRAWN';
    public static final String STATUS_ASSET_SAAS_SCHDFREEZE_LABEL = 'SAAS SCHDFREEZE';
    public static final String STATUS_ASSET_WEB_BASED_LABEL = 'WEB BASED';
    public static final String STATUS_ASSET_THIRDPARTY_LABEL = 'THIRDPARTY';
    public static final String STATUS_ASSET_ACTIVE_LABEL = 'ACTIVE';
    public static final String STATUS_ASSET_TLA_LABEL = 'TLA';
    public static final String STATUS_ASSET_TERM_LABEL = 'TERM';
    public static final String STATUS_ASSET_TERM_SCHDCANCEL_LABEL = 'TERM SCHDCANCEL';

    public AptsCPQConstants () {

    }   
}