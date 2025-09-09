public class CurrentUserInfo {
  public String Url { get; set; }
  public String TelePhoneyUrl { get; set; }
  public String companyId { get; set; }
  public String userId { get; set; }

  public CurrentUserInfo() {
    companyId = (String) UserInfo.getOrganizationId();
    userId = (String) UserInfo.getUserId();
    TelePhoneyUrl =
      'https://client5.rekzyl.com/voice/dialpad?leftServiceId=1352c6aa-d73b-4829-a709-7770bf71966a&service=salesforce&sideBar=false&topBar=false&fullView=false&resource=&view=&companyId=' +
      companyId +
      '&userId=' +
      userId;
  }
}
