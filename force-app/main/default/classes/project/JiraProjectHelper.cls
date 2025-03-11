/**
 * @description       : 
 * @author            : sebasgarcia
 * @group             : 
 * @last modified on  : 03-11-2025
 * @last modified by  : sebasgarcia
**/
public with sharing class JiraProjectHelper {

    public static Account createOrUpdateAccount(Account acc, String projectLeadId) {
        JiraProjectJSON project = JiraProjectMapping.mapAccountToProject(acc, projectLeadId);
        HttpResponse res = JiraCallout.createProject(JSON.serialize(project, true));

        if(res.getStatusCode() != 201) {
            throw new JiraException(res.getBody());
        }
        JiraProjectJSON ProjResponse = JiraProjectJSON.parse(res.getBody());
        acc.Jira_Project_Id__c = ProjResponse.id;
        return acc;
    }
}