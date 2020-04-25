public class MyCustomController {
        public List<Position__c> poslist;
        
        public List<Position__c> getPositions(){
                if(poslist==null)
                        poslist = [Select Id,Name from Position__c  Limit 50];
                
                return poslist;
        }
}