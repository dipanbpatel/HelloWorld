global class MyEmailHandlerClass implements Messaging.InboundEmailHandler{

    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope env){
    
        Messaging.InboundemailResult result = new Messaging.InboundEmailResult();
        
        string plaintext = email.plainTextBody;
        
        PositionExtensions obj = new PositionExtensions();
        obj.insertData();
        
        system.debug('Insert through Email done');
        
        result.success = true;
        
        return result;
    
    }

}