global with sharing class PositionExtensions {

    public final Position__c objPosition;
    public List<Position__c> allData {get;set;}
    public String testData{get;set;}
    public String passData{get;set;}
    private Integer testNumber;
    public Map<string,string> listid{get;set;}
     
    public PositionExtensions(){
    } 
    
    public PositionExtensions(ApexPages.StandardController controller) {
          this.objPosition =(Position__c)controller.getrecord();
          allData = [select ID, Name,Location__c,No_Of_Application__c,Max_Pay__c from Position__c LIMIT 50 ];
           listid = new Map<string,string>();
          listid.put('1','one');
          listid.put('2','two');
          listid.put('3','three');
          listid.put('4','four');
          //liststrid = listid.values();
    }
    
    @RemoteAction
    global static string InvokeByJavascript(String str)
    {
        return 'Hello '+str;
    }
    
    @TestVisible
    private Integer totalNumber(Integer num)
    {
        testNumber = num +1;
        return testNumber;
    }
    
    public string getSalaryData()
    {
        return 'Salary Range: '+ this.objPosition.Min_Salary__c+' - '+ this.objPosition.Max_Pay__c;
    }
    public PageReference  updatedata(){
        //Position__c objPos = [select ID, Name from Position__c where ID='a00i000000HaUcx' LIMIT 1 ];
        //objPos.Max_Pay__c = objPos.Max_Pay__c + 1;
        List<Position__c> listPosition = new List<Position__c>();
        for(Position__c obj : [select ID, Name,Functional_Area__c from Position__c LIMIT 50 ])
        {
            if(obj.Name == 'Project Manager1'){
                obj.Name = 'Project Manager';
                listPosition.add(obj);
            }
            else if(obj.Name == 'Team Leader1'){
                obj.Name = 'Team Leader';
                listPosition.add(obj);
            }
        }
        
        update listPosition;
        return null;
    }
    public PageReference deleteData() {
        Position__c objPos = [select ID, Name from Position__c where ID='a00i000000K6sbR' LIMIT 1 ];
        
        delete objPos;
        return null;
    }
    public PageReference dataPassing(){
       passData = ApexPages.currentPage().getParameters().get('testText');
       return null;
    }
    public PageReference batchProcessing(){
        String query = 'select ID, Name from Position__c where isDeleted=false LIMIT 50';
        TestBatchClass objBatch = new TestBatchClass(query);
        ID batchID = Database.executeBatch(objBatch);
        return null;
    }
    public PageReference insertData() {
        List<Position__c> listPosition = new List<Position__c>();
        Position__c objPos = new Position__c();
        objPos.Travel_Required__c = false;
        objPos.Close_Date__c = Date.today().adddays(90);
        objPos.Max_Pay__c = 5002403;
        objPos.Name = 'Tester1';
        listPosition.add(objPos);
        
        Position__c objPos1 = new Position__c();
        objPos1.Travel_Required__c = false;
        objPos1.Close_Date__c = Date.today().adddays(90);
        objPos1.Max_Pay__c = 6002403;
        objPos1.Name = 'Tester2';
        listPosition.add(objPos1);
        
        
        insert listPosition;
        return null;
    }
    public PageReference collectionSetTest(){
        Account a1 = new account(name='MyAccount');
        Account a2 = new account(name='MyAccount1');
        Set<Account> objSet = new Set<Account>{a1,a2};
        for(Account i: objSet)
        {
            if(i.name=='MyAccount1')i.name='MyAccount';
        }
        //testData = String.valueOf(objSet.size());
        testData = '';
        for(Account i: objSet)
        {
            testData=testData +i.name+'-';
        }
        return null;
    }
    public PageReference collectionListTest(){
        List<Position__c> listPosition = [select ID, Name from Position__c Limit 50];
        testData = listPosition[listPosition.size()-1].name;
        return null;
    }
    public PageReference upsertData(){
        List<Position__c> listPosition = new List<Position__c>();
        //List<Position__c> datalist = [select ID, Name,Functional_Area__c from Position__c LIMIT 50 ];
        for(Position__c obj : [select ID, Name,Functional_Area__c from Position__c LIMIT 50 ])
        {
            if(obj.Name == 'Associate Consultant2'){
                obj.Name = 'Project Manager';
                listPosition.add(obj);
            }
            else if(obj.Name == 'Senior Consultant2'){
                obj.Name = 'Team Leader';
                listPosition.add(obj);
            }
        }
        /*Position__c objPos = new Position__c(Travel_Required__c = false,Functional_Area__c = 'Miscellaneous',Max_Pay__c = 1000050);
        Position__c objPos1 = new Position__c(Travel_Required__c = false,Functional_Area__c = 'Miscellaneous',Max_Pay__c = 1000060);
        listPosition.add(objPos);
        listPosition.add(objPos1);*/
        
        List<Database.upsertResult> result = Database.upsert(listPosition,false);
        for(Database.upsertResult erObj : result)
        {
            if(erObj.isSuccess()){
                System.debug('Successfully Inserted');
            }
            else{
                System.debug('Error while Inserting');
            }
        }
        return null;
    }
}