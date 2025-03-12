Account acc = [SELECT Id, Jira_Project_Id__c, Jira_Project_Key__c, Jira_Project_Name__c FROM Account WHERE Id = '001gL000000udnxQAA'];

JiraProjectHelper.createOrUpdateAccount(acc, '');