trigger TEST_test on Account (after Update ) {

List<Account> lstaccount = New List<Account>();
List<Contact> lstcontact = New List<Contact>();

for( Account a : Trigger.New)
{
    if( a.Type == 'Prospect' && Trigger.OldMap.get(a.Id).Type != 'Prospect' )
    {
        a.adderror('not ALLOWED');
    }
}
/*
for( Account a : lstaccount )
{
    Contact c = New Contact();
    c.Firstname = 'test';
    c.lastname = 'test last';
    c.accountid = a.id;
    c.Level__c = 'test';
    lstcontact.add(c);
}

if(lstcontact.size()>0)
    insert lstcontact;
*/
}