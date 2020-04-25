public class AccountHandler{
    
    public static Account insertNewAccount(string accName){
    
        Account acc1 = new Account(Name=accName);
        try{
            insert acc1;
            return acc1;
        }
        catch(Exception ex){
            return null;
        } 
    
    }

}