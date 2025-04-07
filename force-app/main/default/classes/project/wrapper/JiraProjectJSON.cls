/**
 * @description       : 
 * @author            : sebasgarcia
 * @group             : 
 * @last modified on  : 03-18-2025
 * @last modified by  : sebasgarcia
**/
public with sharing class JiraProjectJSON {

	public String expand;
	public String self;
	public String id;
	public String key;
	public String description;
	public String assigneeType;
	public String name;
	public String projectTypeKey;
	public String leadAccountId;
	public Boolean simplified;
	public String style;
	public Boolean isPrivate;

	
	public static JIRAProjectJSON parse(String json) {
		return (JIRAProjectJSON) System.JSON.deserialize(json, JIRAProjectJSON.class);
	}
}