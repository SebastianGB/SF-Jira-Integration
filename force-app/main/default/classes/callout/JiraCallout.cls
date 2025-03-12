/**
 * @description       : 
 * @author            : sebasgarcia
 * @group             : 
 * @last modified on  : 03-12-2025
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
    * @description 
    * @author sebasgarcia | 03-11-2025 
    * @param body 
    * @return HttpResponse 
    **/
    public static HttpResponse createProject(String body) {
        return httpHelper('project', 'POST', body);
    }
    
    /**
    * @description 
    * @author sebasgarcia | 03-11-2025 
    * @param body 
    * @return HttpResponse 
    **/
    public static HttpResponse updateProject(String body, String projectId) {
        return httpHelper('project/' + projectId, 'PUT', body);
    }
}