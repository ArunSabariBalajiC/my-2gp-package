public class OAppS_Omni_Channel {
    @AuraEnabled
    public static Map<String,Object> custData(){
        //OAppS__OappsCustomData__mdt	 mdata = [Select OAppS__OsyncId__c ,OAppS__IntegId__c, OAppS__Hash__c  from OAppS__OappsCustomData__mdt	];
        
        // Custom metadata removed - using default values
        Map<String,String> metadata =new Map<String,String>();
        metadata.put('OAppS__OsyncId__c','default-osync-id');
        metadata.put('OAppS__IntegId__c','default-integ-id');
        metadata.put('OAppS__Hash__c','default-hash');
        
        System.debug('metadata >>>>>>>>>>> '+ metadata);
        
        return metadata;
    }
}