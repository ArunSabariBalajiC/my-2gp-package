@IsTest
public class PostInstallClass_Test {
    @isTest
    static void testInstallScript() {
        PostInstallClass postinstall = new PostInstallClass();
        Test.testInstall(postinstall, null);
        Test.testInstall(postinstall, new Version(1,0), true);
        List<Account> a = [Select id, name from Account where name ='Newco'];
        System.assertEquals(a.size(), 0, 'Account not found');
    }
    /*
    @isTest static void testCalloutWithStaticResources() {
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('calloutMockTestFile');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json');
        
        Test.setMock(HttpCalloutMock.class, mock);
        HTTPResponse res = PostInstallClass.rest('00D2w00000Qujn3','sabari@oapps.xyz','0052w00000EZqG3');
        
        //System.assertEquals('{"osyncId":"1352c6aa-d73b-4829-a709","integId":"0241b5zz-c62a-3718-a618","leftServiceId":"1352c6aa-d73b-4829-a709-7770bf71966a","rightServiceId":"","code":"","osyncUrl":"","hash" :"0241b5zz-c62a-3718-a618-6661ae60855z"}', res.getBody());
        System.assertEquals(200,res.getStatusCode());
        //System.assertEquals('application/json', res.getHeader('Content-Type'));    
    }*
    @IsTest
    static void testDeployment() {
        PostInstallClass deployMd = new PostInstallClass();
        Metadata.DeployContainer container = deployMd.creatMetaData('1352c6aa-d73b-4829-a709','0241b5zz-c62a-3718-a618','0241b5zz-c62a-3718-a618-6661ae60855z');
        //Metadata.DeployContainer container = deployMd.creatMetaData(null,null,null);
        List<Metadata.Metadata> contents = container.getMetadata();
        System.assertEquals(1, contents.size());
        Metadata.Layout md = (Metadata.Layout) contents.get(0);
        // Perform various assertions the layout metadata.
        System.assertEquals('OappsCustomData', md.fullName);
    }
	*/
}