public class ContactSearch{

    public static List<Contact> searchForContacts(string str1, string str2){
        List<Contact> cnList = [select Id,Name from Contact where LastName =:str1 and MailingPostalCode=:str2];
        return cnList;
    }

}