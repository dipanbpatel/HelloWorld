public class StringArrayTest{

    public static List<string> generateStringArray(Integer size){
        List<string> strlist = new List<string>();
        for(Integer i =0;i<size;i++){
            strlist.add('Test '+i);
        }
        return strlist;
    }

}