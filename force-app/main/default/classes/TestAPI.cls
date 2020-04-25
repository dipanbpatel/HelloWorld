@RestResource(urlMapping='/Accounts/*')
global class TestAPI
{

    @HttpGet
    global static List<Account> getAccounts()
    {
        RestRequest req = RestContext.request;
        return [select ID from Account Limit 2];
    }

}