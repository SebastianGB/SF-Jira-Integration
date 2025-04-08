/**
 * @description       : 
 * @author            : sebasgarcia
 * @group             : 
 * @last modified on  : 04-08-2025
 * @last modified by  : sebasgarcia
**/
public with sharing class JiraVersionMapping {

    public static JiraVersionJSON mapOpportunityToVersion(Opportunity opp) {
        JiraVersionJSON version = new JiraVersionJSON();
        version.name = opp.Jira_Fix_Version_Name__c;
        version.id = opp.Jira_Version_Id__c;
        version.description = opp.Name;
        if(String.isBlank(opp.Jira_Project_Id__c)) {
            throw new JiraException('Cannot create a version with the Jura Project ID null.');
        }

        version.projectId = Integer.valueOf(opp.Jira_Project_Id__c);
        return version;
    }

    public static Opportunity mapVersionToOpportunity(JiraVersionJSON version, Opportunity opp) {
        opp.Jira_Version_Id__c = String.valueOf(version.id);
        return opp; 
    }
}