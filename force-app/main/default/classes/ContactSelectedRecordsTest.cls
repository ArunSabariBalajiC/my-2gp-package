@IsTest
public class ContactSelectedRecordsTest {
  @IsTest
  static void testContactSelectedRecords() {
    // Create test data
    List<Contact> contacts = new List<Contact>();
    for (Integer i = 0; i < 3; i++) {
      Contact con = new Contact(
        FirstName = 'Test Contact ' + i,
        LastName = 'Last Name ' + i,
        Phone = '123-456-789' + i
      );
      contacts.add(con);
    }
    insert contacts;

    // Create a StandardSetController with selected records
    ApexPages.StandardSetController controller = new ApexPages.StandardSetController(
      contacts
    );
    controller.setSelected(contacts);

    // Create an instance of ContactSelectedRecords class
    ContactSelectedRecords records = new ContactSelectedRecords(controller);

    // Verify the selected records
    System.assertEquals(contacts.size(), records.selectedRecords.size());
    for (Integer i = 0; i < contacts.size(); i++) {
      Contact con = records.selectedRecords[i];
      //System.assertEquals(contacts[i].FirstName, con.FirstName);
      //System.assertEquals(contacts[i].LastName, con.LastName);
      //System.assertEquals(contacts[i].Phone, con.Phone);
    }

    // Verify the URL generation
    String expectedUrl =
      'https://client5.rekzyl.com/campaign?leftServiceId=1352c6aa-d73b-4829-a709-7770bf71966a&service=salesforce&userId=' +
      UserInfo.getUserId() +
      '&companyId=' +
      UserInfo.getOrganizationId() +
      '&selectedIds=' +
      records.Ids +
      '&resource=Contact&view=list&sideBar=false&topBar=false&fullView=false';

    System.assertEquals(expectedUrl, records.Url);
  }
}
