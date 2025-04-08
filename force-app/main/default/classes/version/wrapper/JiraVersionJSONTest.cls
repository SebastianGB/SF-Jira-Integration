@isTest
private class JiraVersionJSONTest {
    public static String json = '{'+
	'  \"archived\": false,'+
	'  \"description\": \"An excellent version\",'+
	'  \"id\": \"10000\",'+
	'  \"name\": \"New Version 1\",'+
	'  \"project\": \"PXA\",'+
	'  \"projectId\": 10000,'+
	'  \"releaseDate\": \"2010-07-06\",'+
	'  \"released\": true,'+
	'  \"self\": \"https://your-domain.atlassian.net/rest/api/3/version/10000\",'+
	'  \"userReleaseDate\": \"6/Jul/2010\"'+
	'}';
	static testMethod void testParse() {

		JiraVersionJSON obj = JiraVersionJSON.parse(json);
		System.assert(obj != null);
	}
}