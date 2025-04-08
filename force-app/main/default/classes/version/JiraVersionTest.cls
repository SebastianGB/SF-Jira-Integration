/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an org are executed whenever Apex code is deployed
 * to a production org to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production org. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the org size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class JiraVersionTest {

    private class Mock implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HTTPResponse res = new HTTPResponse();
            if (req.getEndpoint().endsWith('version')) {
                res.setBody(JiraVersionJSONTest.json);
                res.setStatusCode(201);
            } else {
                System.assert(false, 'unexpected endpoint ' + req.getEndpoint());
                return null;
            }
            return res;
        }
    }

    @TestSetup
    static void makeData(){
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User']; 
        User u = new User(Alias = 'standt', Email='maestro+jiraiya@dbz.com', 
            EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
            LocaleSidKey='en_US', ProfileId = p.Id, 
            TimeZoneSidKey='America/Los_Angeles', UserName='maestro+jiraiya@dbz.com');
        insert u;

        Account acc = new Account();
        acc.Name = 'Test Account';
        acc.JIRA_Project_Id__c = '1234';
        insert acc;

        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opp';
        opp.CloseDate = Date.today();
        opp.StageName = 'Closed Won';
        opp.AccountId = acc.Id;
        opp.JIRA_Fix_Version_Name__c = 'Version Name';
        insert opp;
    }

    @isTest(seeAllData=false)
    static void testController() {
        Test.setMock(HttpCalloutMock.class, new Mock());
        Opportunity opp = [SELECT Id FROM Opportunity WHERE Name = 'Test Opp'];
        
        Test.startTest();
        JiraVersionController.createVersion(opp.Id);
        Test.stopTest();

        Opportunity oppAfter = [SELECT Id, JIRA_Version_Id__c FROM Opportunity WHERE Id =: opp.Id];
        System.assert(String.isNotBlank(oppAfter.JIRA_Version_Id__c), 'Version Id Not Set');
    }
}