public class ContactAndLeadSearch{

    public static List<List<SObject>> searchContactsAndLeads(string str){
        
        List<List<SObject>>  searchList = [FIND :str IN NAME FIELDS RETURNING Contact(Name),Lead(FirstName)];
        return searchList;
    }

}