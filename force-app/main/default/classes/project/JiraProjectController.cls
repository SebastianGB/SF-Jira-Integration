/**
 * @description       : 
 * @author            : sebasgarcia
 * @group             : 
 * @last modified on  : 03-12-2025
 * @last modified by  : sebasgarcia
**/
public class JiraProjectController {
    public Id accId {get;set;}
    public Account acc {get;set;}
    
    public JiraProjectController(ApexPages.StandardController controller) {
        accId = controller.getRecord().Id;
        acc = [SELECT Id, Jira_Project_Key__c, Jira_Project_Id__c, Jira_Project_Name__c, Jira_Project_Lead__r.Jira_User_Id__c FROM Account WHERE Id =: accId];
    
        if(acc.Jira_Project_Lead__c== null){
            throw new JiraException('Account Jira Project Lead is empty.');
        }
    }
            
    
    
    public PageReference createProject(){
        try {
            JiraProjectHelper.createOrUpdateAccount(acc, '');
            update acc;
            
            return new PageReference('/'+ accId);
        } catch (JiraException e) {
            throw new JiraException('Problem Updating the Account');
        }
    
    }
}