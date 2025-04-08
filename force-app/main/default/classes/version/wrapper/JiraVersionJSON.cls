public with sharing class JiraVersionJSON {

    public Boolean archived;
	public String description;
	public String id;
	public String name;
	public String project;
	public Integer projectId;
	public String releaseDate;
	public Boolean released;
	public String self;
	public String userReleaseDate;

	
	public static JiraVersionJSON parse(String json) {
		return (JiraVersionJSON) System.JSON.deserialize(json, JiraVersionJSON.class);
	}
}