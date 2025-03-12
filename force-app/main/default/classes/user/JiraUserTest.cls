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
**/

@isTest
public class JiraUserTest {

    private class Mock implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HTTPResponse res = new HTTPResponse();
            if (req.getEndpoint().contains('user')) {
                res.setBody(JIRAUserJSON_Test.json);
                res.setStatusCode(200);
            } else {
                System.assert(false, 'unexpected endpoint ' + req.getEndpoint());
                return null;
            }
            return res;
        }
    }
    
    @isTest(seeAllData=false)
    static void testController() {
        Test.setMock(HttpCalloutMock.class, new Mock());

        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User']; 
        User u = new User(Alias = 'standt', Email='sebasgarcia@sillybilly.com', 
            EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
            LocaleSidKey='en_US', ProfileId = p.Id, 
            TimeZoneSidKey='America/Los_Angeles', UserName='sebasgarcia@sillybilly.com');
        insert u;
        ApexPages.StandardController stdController = new ApexPages.StandardController(
            u
        );
        JiraUserController controller = new JiraUserController(
            stdController
        );
        Test.startTest();
        controller.createUser();
        Test.stopTest();

        User afterUpdate = [SELECT Id, JIRA_User_Id__c FROM User WHERE Id =: u.Id];
        System.assert(String.isNotBlank(afterUpdate.JIRA_User_Id__c), 'JIRA User Id Never Set');
    }
}