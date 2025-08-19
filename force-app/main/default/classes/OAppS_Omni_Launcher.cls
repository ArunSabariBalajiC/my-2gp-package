public class OAppS_Omni_Launcher {
    @AuraEnabled
    public static String callRest(){
        String domain = String.valueof(System.URL.getSalesforceBaseURL().gethost());
        return rest(domain);
    }
    public static String rest(String domain){
        String organisationId = (String)UserInfo.getOrganizationId();
        String orgEmail = UserInfo.getUserEmail();
        System.debug('organisationId >>>>>>> '+ organisationId);
        
        String endpoint = 'https://fd58-2401-4900-1ce1-eb70-b9c2-e7b-d3e9-a2cf.in.ngrok.io/Salesforce/orgId';
        map<String,Object> payload = new map<String,Object>();
        payload.put('orgId', organisationId);
        payload.put('email', orgEmail);
        System.debug('payload >>>>>>>>> '+ payload);
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        HttpResponse response =new HttpResponse();
        request.setEndpoint(endpoint);
        request.setMethod('POST');
        request.setBody(JSON.Serialize(payload));
        response = http.send(request);
        String strResp = null;
        String osyncId = null;
        String integId = null;
        String hash = null;
        if(response.getStatusCode() == 200){
            strResp = response.getBody();
            Map<String,Object> integData =(Map<String,Object>)json.deserializeUntyped(response.getBody());
            System.debug('integData >>>>>>> '+integData);
            osyncId = (String)integData.get('osyncId');
            integId = (String)integData.get('integId');
            hash = (String)integData.get('hash');
        }
        return null;
    }
    
}