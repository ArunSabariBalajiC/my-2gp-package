@isTest
public class ApiCallLightningComponent_Test {
  @isTest
  public static void testGetMetaData() {
    // Prepare test data or use @testSetup methods to create required data.

    Test.startTest();

    // Call the method to be tested
    Map<String, Object> metadata = ApiCallLightningComponent.getMetaData();

    // Perform assertions on the metadata
    System.assertNotEquals(null, metadata, 'Metadata should not be null');
    // Add more assertions based on your specific requirements

    Test.stopTest();
  }
}
