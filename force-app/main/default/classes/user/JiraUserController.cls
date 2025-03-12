/**
 * @description       : 
 * @author            : sebasgarcia
 * @group             : 
 * @last modified on  : 03-12-2025
 * @last modified by  : sebasgarcia
**/
public class JiraUserController {
    public Id userId {get;set;}
    public User user {get;set;}
    
    public JiraUserController(ApexPages.StandardController controller) {
        userId = controller.getRecord().Id;
        user = [SELECT Id, Email, Jira_User_Id__c FROM User WHERE Id =: userId];
    }
    
    public PageReference createUser(){
        JiraUserHelper.getJiraUser(user);
        update user;
        return new PageReference('/'+ userId);
    }
}