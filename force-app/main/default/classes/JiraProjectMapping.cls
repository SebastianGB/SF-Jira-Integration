/**
 * @description       : 
 * @author            : sebasgarcia
 * @group             : 
 * @last modified on  : 03-11-2025
 * @last modified by  : sebasgarcia
**/
public with sharing class JiraProjectMapping {

  public static JiraProjectJSON mapAccountToProject(Account acc, String projectLeadId) {
    JiraProjectJSON json = new JiraProjectJSON();
    json.name = acc.Jira_Project_Name__c;
    json.leadAccountId = projectLeadId;
    json.projectTypeKey = 'software';
    json.key = acc.Jira_Project_Key__c;

    return json;
  }
}