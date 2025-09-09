@IsTest
public class LeadSelectedRecordsTest {
  @IsTest
  static void testLeadSelectedRecords() {
    // Create test data
    List<Lead> leads = new List<Lead>();
    for (Integer i = 0; i < 3; i++) {
      Lead lead = new Lead(
        Company = 'Test Lead',
        LastName = 'Lead Last Name',
        Email = 'test' + i + '@example.com',
        Phone = '123-456-789' + i
      );
      leads.add(lead);
    }
    insert leads;

    // Create a StandardSetController with selected records
    ApexPages.StandardSetController controller = new ApexPages.StandardSetController(
      leads
    );
    controller.setSelected(leads);

    // Create an instance of LeadSelectedRecords class
    LeadSelectedRecords records = new LeadSelectedRecords(controller);

    // Verify the selected records
    System.assertEquals(leads.size(), records.selectedRecords.size());
    for (Integer i = 0; i < leads.size(); i++) {
      Lead lead = records.selectedRecords[i];
      //System.assertEquals(leads[i].FirstName, lead.FirstName);
      //System.assertEquals(leads[i].LastName, lead.LastName);
      //System.assertEquals(leads[i].Phone, lead.Phone);
    }
    String expectedUrl =
      'https://client5.rekzyl.com/campaign?leftServiceId=1352c6aa-d73b-4829-a709-7770bf71966a&service=salesforce&userId=' +
      UserInfo.getUserId() +
      '&companyId=' +
      UserInfo.getOrganizationId() +
      '&selectedIds=' +
      records.Ids +
      '&resource=Lead&view=list&sideBar=false&topBar=false&fullView=false';
    System.assertEquals(expectedUrl, records.Url);
  }
}
