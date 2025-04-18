/**
 * @description       : 
 * @author            : sebasgarcia
 * @group             : 
 * @last modified on  : 03-12-2025
 * @last modified by  : sebasgarcia
**/

@IsTest
public class JiraUserJSON_Test {
	public static String json = '['+
	'    {'+
	'        \"self\": \"https://1sync.atlassian.net/rest/api/3/user?accountId=712020:45638842-520a-44cc-a497-d3673787c0b7\",'+
	'        \"accountId\": \"TEST:12345\",'+
	'        \"accountType\": \"atlassian\",'+
	'        \"emailAddress\": \"justin+jiratest@1sync.co\",'+
	'        \"avatarUrls\": {'+
	'            \"48x48\": \"https://secure.gravatar.com/avatar/dd983846372288d4643907e8df12e7d7?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Finitials%2FJW-5.png\",'+
	'            \"24x24\": \"https://secure.gravatar.com/avatar/dd983846372288d4643907e8df12e7d7?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Finitials%2FJW-5.png\",'+
	'            \"16x16\": \"https://secure.gravatar.com/avatar/dd983846372288d4643907e8df12e7d7?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Finitials%2FJW-5.png\",'+
	'            \"32x32\": \"https://secure.gravatar.com/avatar/dd983846372288d4643907e8df12e7d7?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Finitials%2FJW-5.png\"'+
	'        },'+
	'        \"displayName\": \"Justin Wills\",'+
	'        \"active\": true,'+
	'        \"timeZone\": \"America/Sao_Paulo\",'+
	'        \"locale\": \"en_US\"'+
	'    }'+
	']';
	static testMethod void testParse() {

		List<JiraUserJSON> obj = JiraUserJSON.parse(json);
		System.assert(obj != null);
	}
}