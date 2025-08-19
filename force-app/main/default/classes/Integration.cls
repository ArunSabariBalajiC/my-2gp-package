public class Integration {
    @AuraEnabled
    public static void postInstall(){
        rest();        
    }
    public static HttpResponse rest(){
        //creatMetaData('0241b5zz-rest-osync-temp-6661ae60855z','0241b5zz-rest-integ-temp-6661ae60855z','0241b5zz-rest-onInstall-temp-6661ae60855z');
        //request.setEndpoint('https://yamuna.rekzyl.com/api/v1/integrate');//integrate  https://fd58-2401-4900-1ce1-eb70-b9c2-e7b-d3e9-a2cf.in.ngrok.io
        String organisationId = (String)UserInfo.getOrganizationId();
        String orgEmail = UserInfo.getUserEmail();
        System.debug('organisationId >>>>>>> '+ organisationId);
        
        String endpoint = 'https://fd58-2401-4900-1ce1-eb70-b9c2-e7b-d3e9-a2cf.in.ngrok.io/api/v1/integrate';
        map<String,Object> payload = new map<String,Object>();
        payload.put('orgId', organisationId);
        payload.put('email', orgEmail);
        System.debug('payload >>>>>>>>> '+ payload);
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        request.setBody(JSON.Serialize(payload));
        HttpResponse response = http.send(request);
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
        creatMetaData('0241b5zz-rest-osync-temp-6661ae60855z','0241b5zz-rest-integ-temp-6661ae60855z','0241b5zz-rest-onInstall-temp-6661ae60855z');
        return null;
    }
    public static String creatMetaData(String osyncId, String integId, String hash){
        System.debug('osyncId >>>>>>>>>> '+ osyncId);
        System.debug('IntegId >>>>>>>>>> '+ integId);
        System.debug('hash >>>>>>>>>>>>> '+ hash);
        
        Metadata.DeployContainer container = new Metadata.DeployContainer();
        
        Metadata.CustomMetadata customMetadata = new Metadata.CustomMetadata();
        customMetadata.fullName = 'OappsCustomData'+'.OmniChannel';
        customMetadata.label ='OmniChannel';
        
        Metadata.CustomMetadataValue customMetadataHash =new Metadata.CustomMetadataValue();
        customMetadataHash.field ='OAppS__Hash__c';
        customMetadataHash.value = hash;
        customMetadata.values.add(customMetadataHash);
        container.addMetadata(customMetadata);
        
        Metadata.CustomMetadataValue customMetadataInteg =new Metadata.CustomMetadataValue();
        customMetadataInteg.field ='OAppS__IntegId__c';
        customMetadataInteg.value = integId;
        customMetadata.values.add(customMetadataInteg);
        container.addMetadata(customMetadata);
        
        Metadata.CustomMetadataValue customMetadataOsync =new Metadata.CustomMetadataValue(); 
        customMetadataOsync.field = 'OAppS__OsyncId__c';
        customMetadataOsync.value = osyncId;
        customMetadata.values.add(customMetadataOsync);
        container.addMetadata(customMetadata);
        
        Id resultId ;
        if (!Test.isRunningTest()) {
            resultId = Metadata.Operations.enqueueDeployment(container,null);
        }
        return resultId;
    }
    
}