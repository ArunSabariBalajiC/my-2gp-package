public with sharing class LeadSelectedRecords {
  public List<Lead> getIDs;
  public List<Lead> selectedRecords { get; set; }
  public String Url { get; set; }
  public String Ids = null;
  public LeadSelectedRecords(ApexPages.StandardSetController controller) {
    getIDs = controller.getSelected();
    selectedRecords = new List<Lead>();
    for (Lead acc : getIDs) {
      Lead record = [SELECT Name, phone FROM Lead WHERE Id = :acc.Id];
      selectedRecords.add(record);
      if (Ids != null) {
        Ids += ',' + record.Id;
      } else {
        Ids = record.Id;
      }
    }
    String organisationId = (String) UserInfo.getOrganizationId();
    String userId = (String) UserInfo.getUserId();
    Url =
      'https://client5.rekzyl.com/campaign?leftServiceId=1352c6aa-d73b-4829-a709-7770bf71966a&service=salesforce&userId=' +
      userId +
      '&companyId=' +
      organisationId +
      '&selectedIds=' +
      Ids +
      '&resource=Lead&view=list&sideBar=false&topBar=false&fullView=false';
  }
}
