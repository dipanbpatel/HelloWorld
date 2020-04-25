@isTest(SeeAllData=true)
public class TestingClass
{
    @isTest static void TestInsertData()
    {
        PositionExtensions objPosition = new PositionExtensions();
        objPosition.insertData();
        
        List<Position__c> objTestPosition = [Select ID,Name,Max_Pay__c from Position__c where Name = 'Tester1' LIMIT 1];
        
        System.assertNotEquals(0,objTestPosition.size());
        System.assertEquals('Tester1',objTestPosition[0].Name);
    }
    
    @isTest static void TestUpdateData()
    {
        List<Position__c> objTestPosition = [Select ID,Name,Max_Pay__c from Position__c where Name = 'Project Manager' LIMIT 1];
        
        System.assertEquals(0,objTestPosition.size());
        
        PositionExtensions objPosition = new PositionExtensions();
        objPosition.updateData();
        
        List<Position__c> objTestPosition1 = [Select ID,Name,Max_Pay__c from Position__c where Name = 'Project Manager' LIMIT 1];
        
        System.assertNotEquals(0,objTestPosition1.size());
        System.assertEquals('Project Manager',objTestPosition1[0].Name);
    }
    
    @isTest static void TestPrivateValue()
    {
        PositionExtensions objPosition = new PositionExtensions();
        Integer num = objPosition.totalNumber(10);
        //Integer num = PositionExtensions.
        System.assertEquals(11,num);
    }
}