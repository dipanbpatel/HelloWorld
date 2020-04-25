global with sharing class APTS_customPricingCallback implements Apttus_Config2.CustomClass.IPricingCallback3 {
    
    private Apttus_Config2.CustomClass.PricingMode mode = null;
    private Apttus_Config2.ProductConfiguration cart = null;
    
    private List<Apttus_Config2__LineItem__c> lineItemsToUpdate;
    private Set<Id> lineItemsIdSet;
    
    //Constructor
    global APTS_customPricingCallback(){
        lineItemsToUpdate = new List<Apttus_Config2__LineItem__c>();//List of LineItems to be updated. Use only to update fields which cannot be updated using updatePrice method 
        lineItemsIdSet = new Set<Id>();//Important for duplicate check when using more than one method
    }
    
    /**
     * Callback at the beginning of the pricing call.
     * Use the start method to initialize state
     * @param cart the cart object
     */
    global void start(Apttus_Config2.ProductConfiguration cart) {
        this.cart = cart;
    }
    
    /**
     * Callback to indicate the pricing mode
     * @param mode the pricing mode
     */
    global void setMode(Apttus_Config2.CustomClass.PricingMode mode) {
        this.mode = mode; //enum type field -> get current mode of callback -> this could be ADJUSTMENT, BASEPRICE(when goto price) or ROLLDOWN
        system.debug('###In setMode method:' + mode);
    }
    
    /**
     * Callback before pricing the line item collection
     * Use this method to do all required pre-processing to prepare the line items for pricing.
     * @param itemColl the line item collection to pre-process
     */
    global void beforePricing(Apttus_Config2.ProductConfiguration.LineItemColl itemColl) {
        system.debug('###In beforePricing method '+mode);
        
        
        List<Apttus_Config2.LineItem> allLines = itemColl.getAllLineItems();
        
        for(Apttus_Config2.LineItem liMO : allLines ){
                Apttus_Config2__LineItem__c liSO = liMO.getLineItemSO();
                System.debug('beforepricingmethod '+mode+' '+liSO.id+' '+liSO.Apttus_Config2__LineType__c);
        }
        
        //Example 3: Generate same SKU for bundle and its options
        if(mode == Apttus_Config2.CustomClass.PricingMode.BASEPRICE){//Mode check important to make sure that your logic runs only once per mode execution
            //system.debug('###In beforePricing method - BasePrice');
        }
        else{
            //system.debug('###In beforePricing method - '+mode);
        }
    }
    
    /**
     * Callback before pricing the given line item in the line item collection
     * Use this method to do all required pre-processing to prepare the line item for pricing.
     * @param itemColl the line item collection holding the line item
     * @param lineItemMO the line item to pre-process
     */
    global void beforePricingLineItem(Apttus_Config2.ProductConfiguration.LineItemColl itemColl, Apttus_Config2.LineItem lineItemMO) {
        Apttus_Config2__LineItem__c li = lineItemMO.getLineItemSO();
        system.debug('###In beforePricingLineItem method '+ li.Id);
        
        List<Apttus_Config2.LineItem> allLines = itemColl.getAllLineItems();
        
        for(Apttus_Config2.LineItem liMO : allLines ){
                Apttus_Config2__LineItem__c liSO = liMO.getLineItemSO();
                System.debug('beforepricinglineitemmethod '+mode+' '+liSO.id+' '+liSO.Apttus_Config2__LineType__c);
        }
    }
    
    /**
     * Callback after pricing the line item collection
     * Use this method to do all required post-processing after line items are priced.
     * @param itemColl the line item collection to post-process
     */
    global void afterPricing(Apttus_Config2.ProductConfiguration.LineItemColl itemColl) {
        system.debug('###In afterPricing method '+mode);
        List<Apttus_Config2.LineItem> allLines = itemColl.getAllLineItems();
        
        
        
        for(Apttus_Config2.LineItem liMO : allLines ){
                Apttus_Config2__LineItem__c liSO = liMO.getLineItemSO();
                System.debug('afterpricingmethod '+mode+' '+liSO.id+' '+liSO.Apttus_Config2__LineType__c);
                liSO.Custom_Price__c=33;
        }
    }
    
    /**
     * Callback after pricing the given line item in the line item collection
     * Use this method to do all required post-processing after the line item is priced
     * @param itemColl the line item collection holding the line item
     * @param lineItemMO the line item to post-process
     */
    global void afterPricingLineItem(Apttus_Config2.ProductConfiguration.LineItemColl itemColl, Apttus_Config2.LineItem lineItemMO) {
        
        Apttus_Config2__LineItem__c li = lineItemMO.getLineItemSO();
        system.debug('###In afterPricingLineItem method '+ li.Id);
        
        List<Apttus_Config2.LineItem> allLines = itemColl.getAllLineItems();
        for(Apttus_Config2.LineItem liMO : allLines ){
                Apttus_Config2__LineItem__c liSO = liMO.getLineItemSO();
                System.debug('afterpricinlineitem gmethod '+mode+' '+liSO.id+' '+liSO.Apttus_Config2__LineType__c);
        }
    }
    
    /**
     * Callback to manage custom logic that depends on price list item fields
     * @param plItem the price line item to process
     * @param lineItemMO the line item to process
     */
    global void onPriceItemSet(Apttus_Config2__PriceListItem__c plItem, Apttus_Config2.LineItem lineItemMO) {
        system.debug('###In onPriceItemSet method');
    }
    
    /**
     * Callback after all batches of line items are processed
     * Use the finish method to release state
     */
    global void finish() {
    }
}