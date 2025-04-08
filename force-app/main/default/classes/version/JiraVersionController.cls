/**
 * @description       : 
 * @author            : sebasgarcia
 * @group             : 
 * @last modified on  : 04-08-2025
 * @last modified by  : sebasgarcia
**/
public with sharing class JiraVersionController {

    @AuraEnabled
    public static void createVersion(Id oppId){
        try {
            Opportunity opp = [SELECT Id, Name, JIRA_Fix_Version_Name__c, JIRA_Project_Id__c, JIRA_Version_Id__c FROM Opportunity WHERE Id =: oppId];
            JiraVersionHelper.createVersion(opp);
            update opp;        
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}