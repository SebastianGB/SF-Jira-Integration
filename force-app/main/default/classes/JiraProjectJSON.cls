/**
 * @description       : 
 * @author            : sebasgarcia
 * @group             : 
 * @last modified on  : 03-11-2025
 * @last modified by  : sebasgarcia
**/
public with sharing class JiraProjectJSON {

    public String assigneeType;	//PROJECT_LEAD
	public Integer avatarId;	//10200
	public Integer categoryId;	//10120
	public String description;	//Cloud migration initiative
	public Integer issueSecurityScheme;	//10001
	public String key;	//EX
	public String leadAccountId;	//5b10a0effa615349cb016cd8
	public String name;	//Example
	public Integer notificationScheme;	//10021
	public Integer permissionScheme;	//10011
	public String projectTemplateKey;	//com.atlassian.jira-core-project-templates:jira-core-simplified-process-control
	public String projectTypeKey;	//business
	public String url;	//http://atlassian.com
	
    
    public static JiraProjectJSON parse(String json){
		return (JiraProjectJSON) System.JSON.deserialize(json, JiraProjectJSON.class);
	}
}