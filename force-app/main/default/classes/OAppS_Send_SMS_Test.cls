@isTest
public class OAppS_Send_SMS_Test {
    @TestSetup
    static void setupTestData() {
        // Create test account
        Account testAccount = new Account(
            Name = 'Test Account',
            Phone = '1234567890'
        );
        insert testAccount;
        
        // Create test contact
        Contact testContact = new Contact(
            FirstName = 'Test',
            LastName = 'Contact',
            AccountId = testAccount.Id,
            Phone = '9876543210',
            Email = 'test.contact@example.com'
        );
        insert testContact;
        
        // Create test lead
        Lead testLead = new Lead(
            FirstName = 'Test',
            LastName = 'Lead',
            Company = 'Test Company',
            Phone = '5551234567',
            Email = 'test.lead@example.com'
        );
        insert testLead;
        
        // Custom metadata not needed - using default values in implementation
    }
    
    // Test contactQuery method with Contact ID
    @isTest
    static void testContactQueryWithContact() {
        Contact testContact = [SELECT Id FROM Contact LIMIT 1];
        
        Test.startTest();
        List<Object> result = OAppS_Send_SMS.contactQuery(testContact.Id);
        Test.stopTest();
        
        System.assertNotEquals(null, result, 'Result should not be null');
        System.assertEquals(1, result.size(), 'Should return 1 contact');
        System.assert(result[0] instanceof Contact, 'Should return Contact object');
    }
    
    // Test contactQuery method with Lead ID
    @isTest
    static void testContactQueryWithLead() {
        Lead testLead = [SELECT Id FROM Lead LIMIT 1];
        
        Test.startTest();
        List<Object> result = OAppS_Send_SMS.contactQuery(testLead.Id);
        Test.stopTest();
        
        System.assertNotEquals(null, result, 'Result should not be null');
        System.assertEquals(1, result.size(), 'Should return 1 lead');
        System.assert(result[0] instanceof Lead, 'Should return Lead object');
    }
    
    // Test contactQuery method with Account ID
    @isTest
    static void testContactQueryWithAccount() {
        Account testAccount = [SELECT Id FROM Account LIMIT 1];
        
        Test.startTest();
        List<Object> result = OAppS_Send_SMS.contactQuery(testAccount.Id);
        Test.stopTest();
        
        System.assertNotEquals(null, result, 'Result should not be null');
        System.assertEquals(1, result.size(), 'Should return 1 account');
        System.assert(result[0] instanceof Account, 'Should return Account object');
    }
    
    // Test contactQuery method with null input
    @isTest
    static void testContactQueryWithNull() {
        Test.startTest();
        List<Object> result = OAppS_Send_SMS.contactQuery(null);
        Test.stopTest();
        
        System.assertEquals(null, result, 'Should return null for null input');
    }
    
    // Test contactQuery method with invalid ID
    @isTest
    static void testContactQueryWithInvalidId() {
        Test.startTest();
        List<Object> result = OAppS_Send_SMS.contactQuery('001000000000000');
        Test.stopTest();
        
        System.assertEquals(null, result, 'Should return null for invalid ID');
    }
    
    // Test custData method
    @isTest
    static void testCustData() {
        // Mock the custom metadata if needed
        
        Test.startTest();
        Map<String, Object> result = OAppS_Send_SMS.custData();
        Test.stopTest();
        
        System.assertNotEquals(null, result, 'Result should not be null');
        System.assert(result.containsKey('OAppS__OsyncId__c'), 'Should contain OsyncId');
        System.assert(result.containsKey('OAppS__IntegId__c'), 'Should contain IntegId');
        System.assert(result.containsKey('OAppS__Hash__c'), 'Should contain Hash');
    }
    
    // Test userData method
    @isTest
    static void testUserData() {
        Test.startTest();
        Map<String, Object> result = OAppS_Send_SMS.userData();
        Test.stopTest();
        
        System.assertNotEquals(null, result, 'Result should not be null');
        System.assertEquals(UserInfo.getOrganizationId(), result.get('company_id'), 'Company ID should match');
        System.assertEquals(UserInfo.getUserEmail(), result.get('email'), 'Email should match');
        System.assertEquals(UserInfo.getOrganizationName(), result.get('organizationName'), 'Org name should match');
        System.assertEquals(UserInfo.getUserId(), result.get('userId'), 'User ID should match');
        System.assertEquals(UserInfo.getUserName(), result.get('userName'), 'Username should match');
        System.assertNotEquals(null, result.get('api_domain'), 'API domain should not be null');
        System.assertEquals('1352c6aa-d73b-4829-a709-7770bf71966a', result.get('leftServiceId'), 'Left service ID should match');
        System.assertEquals('paid', result.get('plan'), 'Plan should be paid');
    }
}