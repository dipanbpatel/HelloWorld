@RestResource(urlMapping='/GetAccounts/*')
global class AccountService {

    @HttpGet
    global static List<Account> getAcc()
    {
        RestRequest req = RestContext.request;
        string accID = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        List<Account> accList = [select ID,Name from Account where Id=:accID];
        return accList;
    }
    
}