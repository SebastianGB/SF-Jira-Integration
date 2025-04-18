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
private class JiraIssueQueryJSONTest {

    public static String json = '{'+
	'    \"expand\": \"names,schema\",'+
	'    \"startAt\": 0,'+
	'    \"maxResults\": 1,'+
	'    \"total\": 1,'+
	'    \"issues\": ['+
	'        {'+
	'            \"expand\": \"operations,customfield_10037.properties,versionedRepresentations,editmeta,customfield_10036.properties,changelog,customfield_10010.requestTypePractice,renderedFields\",'+
	'            \"id\": \"11755\",'+
	'            \"self\": \"https://1sync.atlassian.net/rest/api/3/issue/11755\",'+
	'            \"key\": \"ZED-1\",'+
	'            \"fields\": {'+
	'                \"statuscategorychangedate\": \"2024-07-07T18:06:35.583-0300\",'+
	'                \"issuetype\": {'+
	'                    \"self\": \"https://1sync.atlassian.net/rest/api/3/issuetype/10010\",'+
	'                    \"id\": \"10010\",'+
	'                    \"description\": \"A small, distinct piece of work.\",'+
	'                    \"iconUrl\": \"https://1sync.atlassian.net/rest/api/2/universal_avatar/view/type/issuetype/avatar/10318?size=medium\",'+
	'                    \"name\": \"Task\",'+
	'                    \"subtask\": false,'+
	'                    \"avatarId\": 10318,'+
	'                    \"hierarchyLevel\": 0'+
	'                },'+
	'                \"timespent\": 3600,'+
	'                \"customfield_10030\": null,'+
	'                \"project\": {'+
	'                    \"self\": \"https://1sync.atlassian.net/rest/api/3/project/10024\",'+
	'                    \"id\": \"1234\",'+
	'                    \"key\": \"ZED\",'+
	'                    \"name\": \"ZED Project\",'+
	'                    \"projectTypeKey\": \"software\",'+
	'                    \"simplified\": false,'+
	'                    \"avatarUrls\": {'+
	'                        \"48x48\": \"https://1sync.atlassian.net/rest/api/3/universal_avatar/view/type/project/avatar/10419\",'+
	'                        \"24x24\": \"https://1sync.atlassian.net/rest/api/3/universal_avatar/view/type/project/avatar/10419?size=small\",'+
	'                        \"16x16\": \"https://1sync.atlassian.net/rest/api/3/universal_avatar/view/type/project/avatar/10419?size=xsmall\",'+
	'                        \"32x32\": \"https://1sync.atlassian.net/rest/api/3/universal_avatar/view/type/project/avatar/10419?size=medium\"'+
	'                    }'+
	'                },'+
	'                \"customfield_10031\": null,'+
	'                \"customfield_10032\": null,'+
	'                \"fixVersions\": ['+
	'                    {'+
	'                        \"self\": \"https://1sync.atlassian.net/rest/api/3/version/10022\",'+
	'                        \"id\": \"5678\",'+
	'                        \"description\": \"TEST Opp\",'+
	'                        \"name\": \"hello\",'+
	'                        \"archived\": false,'+
	'                        \"released\": false'+
	'                    }'+
	'                ],'+
	'                \"aggregatetimespent\": 3600,'+
	'                \"resolution\": null,'+
	'                \"customfield_10036\": null,'+
	'                \"customfield_10037\": null,'+
	'                \"customfield_10027\": null,'+
	'                \"customfield_10028\": null,'+
	'                \"customfield_10029\": null,'+
	'                \"resolutiondate\": null,'+
	'                \"workratio\": -1,'+
	'                \"watches\": {'+
	'                    \"self\": \"https://1sync.atlassian.net/rest/api/3/issue/ZED-1/watchers\",'+
	'                    \"watchCount\": 1,'+
	'                    \"isWatching\": true'+
	'                },'+
	'                \"lastViewed\": \"2024-07-07T18:06:46.726-0300\",'+
	'                \"created\": \"2024-07-07T18:06:35.183-0300\",'+
	'                \"customfield_10020\": null,'+
	'                \"customfield_10021\": null,'+
	'                \"customfield_10022\": null,'+
	'                \"priority\": {'+
	'                    \"self\": \"https://1sync.atlassian.net/rest/api/3/priority/3\",'+
	'                    \"iconUrl\": \"https://1sync.atlassian.net/images/icons/priorities/medium.svg\",'+
	'                    \"name\": \"Medium\",'+
	'                    \"id\": \"3\"'+
	'                },'+
	'                \"customfield_10023\": null,'+
	'                \"customfield_10024\": null,'+
	'                \"customfield_10025\": null,'+
	'                \"labels\": [],'+
	'                \"customfield_10016\": null,'+
	'                \"customfield_10017\": null,'+
	'                \"customfield_10018\": {'+
	'                    \"hasEpicLinkFieldDependency\": false,'+
	'                    \"showField\": false,'+
	'                    \"nonEditableReason\": {'+
	'                        \"reason\": \"PLUGIN_LICENSE_ERROR\",'+
	'                        \"message\": \"The Parent Link is only available to Jira Premium users.\"'+
	'                    }'+
	'                },'+
	'                \"customfield_10019\": \"0|i00867:\",'+
	'                \"timeestimate\": null,'+
	'                \"aggregatetimeoriginalestimate\": null,'+
	'                \"versions\": [],'+
	'                \"issuelinks\": [],'+
	'                \"assignee\": {'+
	'                    \"self\": \"https://1sync.atlassian.net/rest/api/3/user?accountId=712020%3A45638842-520a-44cc-a497-d3673787c0b7\",'+
	'                    \"accountId\": \"712020:45638842-520a-44cc-a497-d3673787c0b7\",'+
	'                    \"emailAddress\": \"justin@1sync.co\",'+
	'                    \"avatarUrls\": {'+
	'                        \"48x48\": \"https://secure.gravatar.com/avatar/dd983846372288d4643907e8df12e7d7?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Finitials%2FJW-5.png\",'+
	'                        \"24x24\": \"https://secure.gravatar.com/avatar/dd983846372288d4643907e8df12e7d7?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Finitials%2FJW-5.png\",'+
	'                        \"16x16\": \"https://secure.gravatar.com/avatar/dd983846372288d4643907e8df12e7d7?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Finitials%2FJW-5.png\",'+
	'                        \"32x32\": \"https://secure.gravatar.com/avatar/dd983846372288d4643907e8df12e7d7?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Finitials%2FJW-5.png\"'+
	'                    },'+
	'                    \"displayName\": \"Justin Wills\",'+
	'                    \"active\": true,'+
	'                    \"timeZone\": \"America/Sao_Paulo\",'+
	'                    \"accountType\": \"atlassian\"'+
	'                },'+
	'                \"updated\": \"2024-07-07T18:07:00.518-0300\",'+
	'                \"status\": {'+
	'                    \"self\": \"https://1sync.atlassian.net/rest/api/3/status/10006\",'+
	'                    \"description\": \"\",'+
	'                    \"iconUrl\": \"https://1sync.atlassian.net/\",'+
	'                    \"name\": \"To Do\",'+
	'                    \"id\": \"10006\",'+
	'                    \"statusCategory\": {'+
	'                        \"self\": \"https://1sync.atlassian.net/rest/api/3/statuscategory/2\",'+
	'                        \"id\": 2,'+
	'                        \"key\": \"new\",'+
	'                        \"colorName\": \"blue-gray\",'+
	'                        \"name\": \"To Do\"'+
	'                    }'+
	'                },'+
	'                \"components\": [],'+
	'                \"timeoriginalestimate\": null,'+
	'                \"description\": null,'+
	'                \"customfield_10010\": null,'+
	'                \"customfield_10014\": null,'+
	'                \"customfield_10015\": null,'+
	'                \"customfield_10005\": null,'+
	'                \"customfield_10006\": null,'+
	'                \"customfield_10007\": null,'+
	'                \"security\": null,'+
	'                \"customfield_10008\": null,'+
	'                \"aggregatetimeestimate\": null,'+
	'                \"customfield_10009\": null,'+
	'                \"summary\": \"TEST Issue\",'+
	'                \"creator\": {'+
	'                    \"self\": \"https://1sync.atlassian.net/rest/api/3/user?accountId=712020%3A45638842-520a-44cc-a497-d3673787c0b7\",'+
	'                    \"accountId\": \"712020:45638842-520a-44cc-a497-d3673787c0b7\",'+
	'                    \"emailAddress\": \"justin@1sync.co\",'+
	'                    \"avatarUrls\": {'+
	'                        \"48x48\": \"https://secure.gravatar.com/avatar/dd983846372288d4643907e8df12e7d7?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Finitials%2FJW-5.png\",'+
	'                        \"24x24\": \"https://secure.gravatar.com/avatar/dd983846372288d4643907e8df12e7d7?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Finitials%2FJW-5.png\",'+
	'                        \"16x16\": \"https://secure.gravatar.com/avatar/dd983846372288d4643907e8df12e7d7?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Finitials%2FJW-5.png\",'+
	'                        \"32x32\": \"https://secure.gravatar.com/avatar/dd983846372288d4643907e8df12e7d7?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Finitials%2FJW-5.png\"'+
	'                    },'+
	'                    \"displayName\": \"Justin Wills\",'+
	'                    \"active\": true,'+
	'                    \"timeZone\": \"America/Sao_Paulo\",'+
	'                    \"accountType\": \"atlassian\"'+
	'                },'+
	'                \"subtasks\": [],'+
	'                \"reporter\": {'+
	'                    \"self\": \"https://1sync.atlassian.net/rest/api/3/user?accountId=712020%3A45638842-520a-44cc-a497-d3673787c0b7\",'+
	'                    \"accountId\": \"712020:45638842-520a-44cc-a497-d3673787c0b7\",'+
	'                    \"emailAddress\": \"justin@1sync.co\",'+
	'                    \"avatarUrls\": {'+
	'                        \"48x48\": \"https://secure.gravatar.com/avatar/dd983846372288d4643907e8df12e7d7?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Finitials%2FJW-5.png\",'+
	'                        \"24x24\": \"https://secure.gravatar.com/avatar/dd983846372288d4643907e8df12e7d7?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Finitials%2FJW-5.png\",'+
	'                        \"16x16\": \"https://secure.gravatar.com/avatar/dd983846372288d4643907e8df12e7d7?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Finitials%2FJW-5.png\",'+
	'                        \"32x32\": \"https://secure.gravatar.com/avatar/dd983846372288d4643907e8df12e7d7?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Finitials%2FJW-5.png\"'+
	'                    },'+
	'                    \"displayName\": \"Justin Wills\",'+
	'                    \"active\": true,'+
	'                    \"timeZone\": \"America/Sao_Paulo\",'+
	'                    \"accountType\": \"atlassian\"'+
	'                },'+
	'                \"aggregateprogress\": {'+
	'                    \"progress\": 3600,'+
	'                    \"total\": 3600,'+
	'                    \"percent\": 100'+
	'                },'+
	'                \"customfield_10000\": \"{}\",'+
	'                \"customfield_10001\": null,'+
	'                \"customfield_10002\": null,'+
	'                \"customfield_10003\": null,'+
	'                \"customfield_10004\": null,'+
	'                \"customfield_10038\": null,'+
	'                \"customfield_10039\": null,'+
	'                \"environment\": null,'+
	'                \"duedate\": null,'+
	'                \"progress\": {'+
	'                    \"progress\": 3600,'+
	'                    \"total\": 3600,'+
	'                    \"percent\": 100'+
	'                },'+
	'                \"votes\": {'+
	'                    \"self\": \"https://1sync.atlassian.net/rest/api/3/issue/ZED-1/votes\",'+
	'                    \"votes\": 0,'+
	'                    \"hasVoted\": false'+
	'                }'+
	'            }'+
	'        }'+
	'    ]'+
	'}';
	static testMethod void testParse() {

		JiraIssueQueryJSON obj = JiraIssueQueryJSON.parse(json);
		System.assert(obj != null);
	}
}