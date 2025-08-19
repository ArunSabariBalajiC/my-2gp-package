public class OAppS_Send_SMS {
    @AuraEnabled
    public static List<object> contactQuery(String accountIds){
        if(accountIds!=null){
            List<Contact> contactList = [Select Id, Name, AccountId, phone, Email From Contact Where Id = :accountIds];
            List<Lead> leadList = [Select Id, Name, phone, Email From Lead Where Id = :accountIds];
        	List<Account> accountList = [Select Id, Name, phone From Account Where Id = :accountIds];
        	if(contactList!=null && !contactList.isEmpty()){
                System.debug('conatactList >>>>>>>>>>>>>> '+ contactList);
            	return contactList;
        	}
        	if(leadList!=null && !leadList.isEmpty()){
                System.debug('leadList >>>>>>>>>>>>>> '+ leadList);
            	return leadList;
        	}
        	if(accountList!=null && !accountList.isEmpty()){
                System.debug('accountList >>>>>>>>>>>>>> '+ accountList);
            	return accountList;
        	}
        }
        return null;
    }
    @AuraEnabled
    public static Map<String,Object> custData(){
        // Custom metadata removed - using default values
        Map<String,String> metadata =new Map<String,String>();
        metadata.put('OAppS__OsyncId__c','default-osync-id');
        metadata.put('OAppS__IntegId__c','default-integ-id');
        metadata.put('OAppS__Hash__c','default-hash');
        
        System.debug('metadata >>>>>>>>>>> '+ metadata);
        
        return metadata;
    }
    @AuraEnabled
    public static Map<String,Object> userData(){

        String organisationId = (String)UserInfo.getOrganizationId();
        String orgEmail = UserInfo.getUserEmail();
        UserInfo.getOrganizationName();
        UserInfo.getUserId();
        UserInfo.getUserName();
        String instance = System.URL.getSalesforceBaseURL().toExternalForm();
        
        map<String,Object> payload = new map<String,Object>();
        payload.put('company_id', UserInfo.getOrganizationId());
        payload.put('email', UserInfo.getUserEmail());
        payload.put('organizationName', UserInfo.getOrganizationName());
        payload.put('userId',UserInfo.getUserId());
        payload.put('userName',UserInfo.getUserName());
        payload.put('api_domain',instance);
        payload.put('leftServiceId','1352c6aa-d73b-4829-a709-7770bf71966a');
        payload.put('plan','paid');
        
        System.debug('payload >>>>>>>>>>> '+ payload);
        
        return payload;
    }
}