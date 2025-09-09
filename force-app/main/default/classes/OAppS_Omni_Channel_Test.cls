@isTest
public class OAppS_Omni_Channel_Test {
  @testSetup
  static void dataSetup() {
  }
  @istest
  static void Test_soqlQuery() {
    OAppS_Omni_Channel.custData();
    Map<String, Object> result = OAppS_Omni_Channel.custData();

    // Verify the expected values
    System.assertNotEquals(null, result);
  }
  @isTest
  public static void testCustData() {
    // Start the test
    Test.startTest();

    // Call the method to be tested
    Map<String, Object> result = OAppS_Omni_Channel.custData();

    System.assertNotEquals(null, result);
    // Verify the expected default values
    System.assertEquals('default-osync-id', result.get('OAppS__OsyncId__c'));
    System.assertEquals('default-integ-id', result.get('OAppS__IntegId__c'));
    System.assertEquals('default-hash', result.get('OAppS__Hash__c'));

    // Stop the test
    Test.stopTest();
  }
}
