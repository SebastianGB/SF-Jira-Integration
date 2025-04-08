/**
 * @description       : 
 * @author            : sebasgarcia
 * @group             : 
 * @last modified on  : 04-08-2025
 * @last modified by  : sebasgarcia
**/
public with sharing class JiraVersionHelper {
 
    public static Opportunity createVersion(Opportunity opp) {
        JiraVersionJSON version = JiraVersionMapping.mapOpportunityToVersion(opp); 
        HttpResponse res = JiraCallout.createVersion(JSON.serialize(version));
        if(res.getStatusCode() != 201) {
            throw new JiraException('Could not create JIRA version');
        }

        JiraVersionJSON versionResponse = JiraVersionJSON.parse(res.getBody());

        JiraVersionMapping.mapVersionToOpportunity(versionResponse, opp);
        return opp;
    }
}