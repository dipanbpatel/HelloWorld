public class AccountHandler{
    
    public static Account insertNewAccount(string accName){
    
        Account acc = new Account(Name=accName);  
        try{
            insert acc;
            return acc;
        }
        catch(Exception ex){
            return null;
        } 
    
    }

}