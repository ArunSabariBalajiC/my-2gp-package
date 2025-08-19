@isTest
public class IntegrationTest {
    @isTest static void testCalloutWithStaticResources() {
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('calloutMockTestFile');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json');
        
        Test.setMock(HttpCalloutMock.class, mock);
        //HTTPResponse res = Integration.rest('00D2w00000Qujn3','sabari@oapps.xyz');
        HTTPResponse res = Integration.rest();
        
        //System.assertEquals('{"osyncId":"1352c6aa-d73b-4829-a709","integId":"0241b5zz-c62a-3718-a618","leftServiceId":"1352c6aa-d73b-4829-a709-7770bf71966a","rightServiceId":"","code":"","osyncUrl":"","hash" :"0241b5zz-c62a-3718-a618-6661ae60855z"}', res.getBody());
        //System.assertEquals(200,res.getStatusCode());
        //System.assertEquals('application/json', res.getHeader('Content-Type'));    
    }

}