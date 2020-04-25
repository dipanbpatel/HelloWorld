global class PricingCallback implements Apttus_Config2.CustomClass.IPricingCallback2 {
    Id proposalId;
    public String configId = '';

    //cart
    private Apttus_Config2.ProductConfiguration cart = null;
    //mode
    private Apttus_Config2.CustomClass.PricingMode mode =null;
    
    private List<Apttus_Config2__LineItem__c> linesTestOnly;
    private Apttus_Config2__ProductConfiguration__c configSO;
    private Apttus_Proposal__Proposal__c quote;
    private Apttus_Config2.LineItem configline;
    
    global PricingCallback() {
        
    }
    
    global void start(Apttus_Config2.ProductConfiguration cart) {
        this.cart = cart;

        
    }
    
    global void setMode(Apttus_Config2.CustomClass.PricingMode mode) {
        this.mode = mode;
    }
    
    global void beforePricing(Apttus_Config2.ProductConfiguration.LineItemColl itemColl) {
        //apexPages.addMessage(New ApexPages.Message(ApexPages.Severity.INFO, ' Before Pricing called'));
        //if (this.mode == Apttus_Config2.CustomClass.PricingMode.BASEPRICE){
            for (Apttus_Config2.LineItem configLineItem : itemColl.getAllLineItems()){
               Apttus_Config2__LineItem__c lineItem = configLineItem.getLineItemSO();
               try{
                    system.debug('IF - Ignore Term on line item is  '+lineItem.Ignore_Term__c+'     mode: '+this.mode);
                    
                    
                    if (lineItem.Ignore_Term__c ) {

                        /*system.debug('IF - Ignore Term on line item is True ');
                        system.debug('IF - lineItem.Apttus_Config2__ListPrice__c before ' + lineItem.Apttus_Config2__ListPrice__c);
                        system.debug('IF - Apttus_Config2__SellingTerm__c before ' + lineitem.Apttus_Config2__SellingTerm__c);
                        system.debug('IF - lineItem.Apttus_Config2__BasePriceOverride__c before ' + lineItem.Apttus_Config2__BasePriceOverride__c);
                        system.debug('lineItem.Apttus_Config2__AdjustmentAmount__c-------->'+lineItem.Apttus_Config2__AdjustmentAmount__c);
                        system.debug('lineItem.Apttus_Config2__NetPrice__c-------->'+lineItem.Apttus_Config2__NetPrice__c);*/
                        lineitem.Apttus_Config2__SellingTerm__c = 1;
                        /*if (lineItem.Apttus_Config2__AdjustmentAmount__c != null && lineItem.Apttus_Config2__AdjustmentType__c =='Base Price Override'){
                            //lineItem.Apttus_Config2__BasePriceOverride__c  = lineItem.Apttus_Config2__AdjustmentAmount__c;
                            lineItem.Apttus_Config2__BaseExtendedPrice__c = lineItem.Apttus_Config2__AdjustmentAmount__c * lineItem.Apttus_Config2__Quantity__c;
                            lineItem.Apttus_Config2__ExtendedPrice__c = lineItem.Apttus_Config2__BaseExtendedPrice__c;
                            system.debug('Adjustment Type is Base Price Override '+ lineitem.Apttus_Config2__SellingTerm__c+ '  '+lineItem.Apttus_Config2__BasePriceOverride__c);
                        } else if (lineItem.Apttus_Config2__AdjustmentAmount__c != null && lineItem.Apttus_Config2__AdjustmentType__c =='% Discount'){
                             //lineItem.Apttus_Config2__BasePriceOverride__c  = (lineItem.Apttus_Config2__ListPrice__c * lineItem.Apttus_Config2__Quantity__c) - ((lineItem.Apttus_Config2__ListPrice__c * lineItem.Apttus_Config2__Quantity__c) * (lineItem.Apttus_Config2__AdjustmentAmount__c/100)) ;
                             lineItem.Apttus_Config2__BasePriceOverride__c= null;
                             lineItem.Apttus_Config2__BaseExtendedPrice__c = lineItem.Apttus_Config2__BasePrice__c * lineItem.Apttus_Config2__Quantity__c;
                            lineItem.Apttus_Config2__ExtendedPrice__c = lineItem.Apttus_Config2__BaseExtendedPrice__c;
                             system.debug('Adjustment Type is  % Discount '+ lineitem.Apttus_Config2__SellingTerm__c+ '  '+lineItem.Apttus_Config2__BasePriceOverride__c);
                        } else if (lineItem.Apttus_Config2__AdjustmentAmount__c != null && lineItem.Apttus_Config2__AdjustmentType__c =='Discount Amount'){
                            //lineItem.Apttus_Config2__BasePriceOverride__c  = (lineItem.Apttus_Config2__ListPrice__c * lineItem.Apttus_Config2__Quantity__c) - lineItem.Apttus_Config2__AdjustmentAmount__c ;
                            lineItem.Apttus_Config2__BasePriceOverride__c= null;
                            lineItem.Apttus_Config2__BaseExtendedPrice__c = lineItem.Apttus_Config2__BasePrice__c * lineItem.Apttus_Config2__Quantity__c;
                            lineItem.Apttus_Config2__ExtendedPrice__c = lineItem.Apttus_Config2__BaseExtendedPrice__c;
                            system.debug('Adjustment Type is Discount Amount'+ lineitem.Apttus_Config2__SellingTerm__c+ '  '+lineItem.Apttus_Config2__BasePriceOverride__c);
                        } else {
                            system.debug('Inside Else');
                            lineItem.Apttus_Config2__BasePriceOverride__c= null;
                            lineItem.Apttus_Config2__BaseExtendedPrice__c = lineItem.Apttus_Config2__BasePrice__c * lineItem.Apttus_Config2__Quantity__c;
                            lineItem.Apttus_Config2__ExtendedPrice__c = lineItem.Apttus_Config2__BaseExtendedPrice__c;
                        }*/
                        //lineItem.Apttus_Config2__BaseExtendedPrice__c = lineItem.Apttus_Config2__ListPrice__c * lineItem.Apttus_Config2__Quantity__c;
                        //lineItem.Apttus_Config2__ExtendedPrice__c = lineItem.Apttus_Config2__ListPrice__c * lineItem.Apttus_Config2__Quantity__c;
                       //configLineItem.updatePrice();
                        system.debug('IF - lineItem.Apttus_Config2__BasePriceOverride__c after ' + lineItem.Apttus_Config2__BasePriceOverride__c);
                        System.debug('IF - inside if lineItem.Apttus_Config2__NetPrice__c: '+lineItem.Apttus_Config2__NetPrice__c);
                    } 
                    //configLineItem.updatePrice();
                } catch (Exception e ){
                        System.debug('Exception in beforePricing ====>'+ e.getMessage());
                        System.debug('Cause: ' + e.getCause());    
                        System.debug('Line number: ' + e.getLineNumber());    
                        System.debug('Stack trace: ' + e.getStackTraceString());                           
                }                 
            }
        //}
    }
    
    global void beforePricingLineItem(Apttus_Config2.ProductConfiguration.LineItemColl itemColl, Apttus_Config2.LineItem lineItemMO) {
        system.debug('this is before pricing line item');
    }
    
    global void afterPricing(Apttus_Config2.ProductConfiguration.LineItemColl itemColl) {

    }
    
    global void afterPricingLineItem(Apttus_Config2.ProductConfiguration.LineItemColl itemColl, Apttus_Config2.LineItem lineItemMO) {
        
    }    
    
    global void setDefaults(Apttus_Config2.LineItem li, Apttus_Config2__ProductAttributeValue__c pav) {
    }
    
    global void finish() {
        
    }
}