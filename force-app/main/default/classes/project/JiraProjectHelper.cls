/**
 * @description       : 
 * @author            : sebasgarcia
 * @group             : 
 * @last modified on  : 03-12-2025
 * @last modified by  : sebasgarcia
**/
public with sharing class JiraProjectHelper {

    /**
    * @description 
    * @author sebasgarcia | 03-12-2025 
    * @param acc 
    * @param projectLeadId 
    * @return Account 
    **/
    public static Account createOrUpdateAccount(Account acc, String projectLeadId) {
        JiraProjectJSON project = JiraProjectMapping.mapAccountToProject(acc, projectLeadId);
        HttpResponse res;
        if (String.isBlank(acc.Jira_Project_Id__c)) {
            res = JiraCallout.createProject(JSON.serialize(project, true));
        } else {
            res = JiraCallout.updateProject(JSON.serialize(project, true), acc.Jira_Project_Id__c); 
        }

        if(res.getStatusCode() != 201 && res.getStatusCode() != 200) {
            throw new JiraException(res.getBody());
        }
        
        JiraProjectJSON ProjResponse = JiraProjectJSON.parse(res.getBody());
        acc.Jira_Project_Id__c = ProjResponse.id;
        return acc;
    }
}