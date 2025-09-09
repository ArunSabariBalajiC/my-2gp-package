public class ApiCallLightningComponent {
  @AuraEnabled
  public static Map<String, Object> getMetaData() {
    String organisationId = (String) UserInfo.getOrganizationId();
    String orgEmail = UserInfo.getUserEmail();
    UserInfo.getOrganizationName();
    UserInfo.getUserId();
    UserInfo.getUserName();
    String instance = System.URL.getSalesforceBaseURL().toExternalForm();

    map<String, Object> payload = new Map<String, Object>();
    payload.put('company_id', UserInfo.getOrganizationId());
    payload.put('email', UserInfo.getUserEmail());
    payload.put('organizationName', UserInfo.getOrganizationName());
    payload.put('userId', UserInfo.getUserId());
    payload.put('userName', UserInfo.getUserName());
    payload.put('api_domain', instance);
    payload.put('leftServiceId', '1352c6aa-d73b-4829-a709-7770bf71966a');
    payload.put('plan', 'paid');

    System.debug('payload >>>>>>>>>>> ' + payload);

    return payload;
  }
}
