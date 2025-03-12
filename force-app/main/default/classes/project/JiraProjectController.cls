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
        acc = [SELECT Id, Jira_Project_Key__c, Jira_Project_Id__c, Jira_Project_Name__c FROM Account WHERE Id =: accId];
    }
    
    public PageReference createProject(){

        try {
            JiraProjectHelper.createOrUpdateAccount(acc, '');
            update acc;
            
            return new PageReference('/'+ accId);
        } catch (JiraException e) {
            ApexPages.addMessages((new JiraException(e.getMessage())));
            return null;
        }
    
    }
}