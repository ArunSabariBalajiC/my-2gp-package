@IsTest
public class AccountSelectedRecordsTest {
  @IsTest
  static void testAccountSelectedRecords() {
    // Create test data
    List<Account> accounts = new List<Account>();
    for (Integer i = 0; i < 3; i++) {
      Account acc = new Account(
        Name = 'Test Account ' + i,
        Phone = '123-456-789' + i
      );
      accounts.add(acc);
    }
    insert accounts;

    // Create a StandardSetController with selected records
    ApexPages.StandardSetController controller = new ApexPages.StandardSetController(
      accounts
    );
    controller.setSelected(accounts);

    // Create an instance of AccountSelectedRecords class
    AccountSelectedRecords records = new AccountSelectedRecords(controller);

    // Verify the selected records
    System.assertEquals(accounts.size(), records.selectedRecords.size());
    for (Integer i = 0; i < accounts.size(); i++) {
      Account acc = records.selectedRecords[i];
      System.assertEquals(accounts[i].Name, acc.Name);
      System.assertEquals(accounts[i].Phone, acc.Phone);
    }

    // Verify the URL generation
    String expectedUrl =
      'https://client5.rekzyl.com/campaign?leftServiceId=1352c6aa-d73b-4829-a709-7770bf71966a&service=salesforce&userId=' +
      UserInfo.getUserId() +
      '&companyId=' +
      UserInfo.getOrganizationId() +
      '&selectedIds=' +
      records.Ids +
      '&resource=Account&view=list&sideBar=false&topBar=false&fullView=false';

    System.assertEquals(expectedUrl, records.Url);
  }
}
