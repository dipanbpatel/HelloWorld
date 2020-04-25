@isTest
public class AccountServiceTest {

    static testMethod void testgetAccount()
    {
        Account acc = new Account();
        acc.Name = 'TestAccount';
        acc.AccountNumber = '12345';
        insert acc;
        RestRequest req = new RestRequest();
        req.addHeader('httpMethod', 'GET');
        req.requestURI = 'https://na15.salesforce.com/services/apexrest/GetAccounts/'+acc.ID;
        RestContext.request = req;
        List<Account> testAccList = AccountService.getAcc();
        system.assertEquals(testAccList.size(), 1);
    }
    
}