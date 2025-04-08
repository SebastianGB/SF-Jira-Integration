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
public class JiraProjectTest {

    private class Mock implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HTTPResponse res = new HTTPResponse();
            if (req.getEndpoint().endsWith('project')) {
                res.setBody(JiraProjectJSON_Test.json);
                res.setStatusCode(201);
            } else if (req.getEndpoint().contains('project/')) {
                res.setBody(JiraProjectJSON_Test.json);
                res.setStatusCode(200);
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
        User u = new User(Alias = 'standt', Email='themeister@mesitermail.com', 
            EmailEncodingKey='UTF-8', LastName='Test', LanguageLocaleKey='en_US', 
            LocaleSidKey='en_US', ProfileId = p.Id, 
            TimeZoneSidKey='America/Los_Angeles', UserName='themeister@mesitermail.com', JIRA_User_Id__c='hehehe');
        insert u;
        Account acc = new Account();
        acc.Name = 'Test Account';
        acc.JIRA_Project_Lead__c = u.Id;
        insert acc;
    }

    @isTest(seeAllData=false)
    static void testController() {
        Account acc = [SELECT Id FROM Account WHERE Name = 'Test Account'];
        Test.setMock(HttpCalloutMock.class, new Mock());
        ApexPages.StandardController stdController = new ApexPages.StandardController(
            acc
        );
        JiraProjectController controller = new JiraProjectController(
        stdController
        );
        Test.startTest();
        controller.createProject();
        Test.stopTest();

        Account afterUpdate = [SELECT Id, JIRA_Project_Id__c FROM Account WHERE Id =: acc.Id];
        System.assert(String.isNotBlank(afterUpdate.JIRA_Project_Id__c), 'JIRA Project Id Never Set');
    }

    @isTest(seeAllData=false)
    static void testCheckKey() {
        Test.setMock(HttpCalloutMock.class, new Mock());        
        Test.startTest();
        boolean available = JiraProjectWizardController.checkJiraKeyAvailable('KEY');
        Test.stopTest();

        System.assert(!available, 'Key should not be available.');
    }
}