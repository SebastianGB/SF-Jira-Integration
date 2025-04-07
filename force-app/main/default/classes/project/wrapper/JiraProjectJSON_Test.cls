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
public class JiraProjectJSON_Test {

	public static String json = '{'+
	'  "assigneeType": "PROJECT_LEAD",'+
	'  "avatarId": 10200,'+
	'  "categoryId": 10120,'+
	'  "description": "Cloud migration initiative",'+
	'  "issueSecurityScheme": 10001,'+
	'  "key": "EX",'+
	'  "leadAccountId": "5b10a0effa615349cb016cd8",'+
	'  "name": "Example",'+
	'  "notificationScheme": 10021,'+
	'  "permissionScheme": 10011,'+
	'  "projectTemplateKey": "com.atlassian.jira-core-project-templates:jira-core-simplified-process-control",'+
	'  "projectTypeKey": "business",'+
	'  "url": "http://atlassian.com"'+
	'}';

	static testMethod void testParse() {
	
		JiraProjectJSON obj = JiraProjectJSON.parse(json);
		System.assert(obj != null);
	}
}