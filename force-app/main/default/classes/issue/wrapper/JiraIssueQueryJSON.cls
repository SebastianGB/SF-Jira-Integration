/**
 * @description       : 
 * @author            : sebasgarcia
 * @group             : 
 * @last modified on  : 04-08-2025
 * @last modified by  : sebasgarcia
**/
public with sharing class JiraIssueQueryJSON {

    public class Status {
		public String self;
		public String description;
		public String iconUrl;
		public String name;
		public String id;
		public StatusCategory statusCategory;
	}

	public class Assignee {
		public String self;
		public String accountId;
		public String emailAddress;
		public String displayName;
		public Boolean active;
		public String timeZone;
		public String accountType;
	}

	public class Priority {
		public String self;
		public String iconUrl;
		public String name;
		public String id;
	}

	public class Issues {
		public String expand;
		public String id;
		public String self;
		public String key;
		public Fields fields;
	}

	public class Watches {
		public String self;
		public Integer watchCount;
		public Boolean isWatching;
	}

	public String expand;
	public Integer startAt;
	public Integer maxResults;
	public Integer total;
	public List<Issues> issues;

	public class Labels {
	}

	public class Project {
		public String self;
		public String id;
		public String key;
		public String name;
		public String projectTypeKey;
		public Boolean simplified;
	}

	public class StatusCategory {
		public String self;
		public Integer id;
		public String key;
		public String colorName;
		public String name;
	}

	public class Fields {
		// public String statuscategorychangedate;
		public Issuetype issuetype;
		public Integer timespent;
		public Project project;
		public List<FixVersions> fixVersions;
		public Integer aggregatetimespent;
		public Integer workratio;
		public Watches watches;
		public String lastViewed;
        // public String description; //@TODO field is an object and not a string
		public String created;
		public Priority priority;
		public List<Labels> labels;
		public List<Labels> versions;
		public List<Labels> issuelinks;
		public Assignee assignee;
		public String updated;
		public Status status;
		public List<Labels> components;
		public String summary;
		public Assignee creator;
		public List<Labels> subtasks;
		public Assignee reporter;
	}

	public class NonEditableReason {
		public String reason;
		public String message;
	}

	public class FixVersions {
		public String self;
		public String id;
		public String description;
		public String name;
		public Boolean archived;
		public Boolean released;
	}


	public class Issuetype {
		public String self;
		public String id;
		public String description;
		public String iconUrl;
		public String name;
		public Boolean subtask;
		public Integer avatarId;
		public Integer hierarchyLevel;
	}


	public class Votes {
		public String self;
		public Integer votes;
		public Boolean hasVoted;
	}

	
	public static JiraIssueQueryJSON parse(String json) {
		return (JiraIssueQueryJSON) System.JSON.deserialize(json, JiraIssueQueryJSON.class);
	}
}