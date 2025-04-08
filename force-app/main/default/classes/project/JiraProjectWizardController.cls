/**
 * @description       : 
 * @author            : sebasgarcia
 * @group             : 
 * @last modified on  : 03-17-2025
 * @last modified by  : sebasgarcia
**/
public with sharing class JiraProjectWizardController {
    /**
    * @description true if jira project key has not been taken
    * @author sebasgarcia | 03-17-2025 
    * @param key 
    * @return Boolean 
    **/
    @AuraEnabled
    public static Boolean checkJiraKeyAvailable(String key){
        Boolean available = false;

        try {
            HttpResponse res = JiraCallout.getProject(key);

            if(res.getStatusCode() == 401) {
                throw new JiraException('Unauthorized with Jira');
            }

            available = res.getStatusCode() != 200;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return available;
    }

    /**
    * @description create Jira Project from the Account record page
    * @author sebasgarcia | 03-17-2025 
    * @param Key 
    * @param projectName 
    * @param accId 
    * @param userId 
    * @return Boolean 
    **/
    @AuraEnabled
    public static Boolean createProject(String Key, String projectName, Id accId, Id userId){
        Boolean success = false;
        Account acc = new Account();
        acc.id = accId;
        acc.Jira_Project_Key__c = key;
        acc.Jira_Project_Name__c = projectName;
        acc.Jira_Project_Lead__c = userId;
        User leadUser = [SELECT Id, Jira_User_Id__c from User WHERE id =: userId];
        String projectLeadId = leadUser.Jira_User_Id__c;
        try {
            JiraProjectHelper.createOrUpdateAccount(acc, projectLeadId);
            update acc;
            success = true;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        
        return success;
    }
}