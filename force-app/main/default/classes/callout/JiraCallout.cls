/**
 * @description       : 
 * @author            : sebasgarcia
 * @group             : 
 * @last modified on  : 04-07-2025
 * @last modified by  : sebasgarcia
**/
public with sharing class JiraCallout {
    public JiraCallout() {

    }


    /**
    * @description 
    * @author sebasgarcia | 03-11-2025 
    * @param endpoint 
    * @param method 
    * @param body 
    * @return HttpResponse 
    **/
    private static HttpResponse httpHelper(String endpoint, String method, String body) {
        Http h = new Http();
        HttpRequest req = new HttpRequest();

        if( body != null) {
            req.setBody(body);
            req.setHeader('Content-Type', 'application/json');
        }
        req.setMethod(method);
        req.setEndpoint('callout:Jira/' + endpoint);

        HttpResponse res = h.send(req);
        System.Debug(res.getBody());

        return res;
    }


    /**
    * @description Create New Project
    * @author sebasgarcia | 03-11-2025 
    * @param body 
    * @return HttpResponse 
    **/
    public static HttpResponse createProject(String body) {
        return httpHelper('project', 'POST', body);
    }
    
    /**
    * @description Update Project using Jira Project Id on Account
    * @author sebasgarcia | 03-11-2025 
    * @param body 
    * @return HttpResponse 
    **/
    public static HttpResponse updateProject(String body, String projectId) {
        return httpHelper('project/' + projectId, 'PUT', body);
    }

    /**
    * @description Get User based on user Email
    * @author sebasgarcia | 03-12-2025 
    * @param email 
    * @return HttpResponse 
    **/
    public static HttpResponse getUser(String email) {
        return httpHelper('user/search?query=', 'GET', null);
    }

    /**
    * @description Get Project using Jira Project Id on Account
    * @author sebasgarcia | 03-12-2025 
    * @param projectId 
    * @return HttpResponse 
    **/
    public static HttpResponse getProject(String projectId) {
        return httpHelper('project/' + projectId, 'GET', null);
    }

    /**
    * @description create version of a project's release
    * @author sebasgarcia | 04-07-2025 
    * @param version 
    * @return HttpResponse 
    **/
    public static HttpResponse createVersion(String version) {
        return httpHelper('version', 'POST', version);
    }
}