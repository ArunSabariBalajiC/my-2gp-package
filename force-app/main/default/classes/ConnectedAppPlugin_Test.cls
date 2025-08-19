@isTest
public class ConnectedAppPlugin_Test {
    @isTest
    public static void customAttributesTest(){
        Map<String,String> mapstr = new Map<String,String>();
        Test.startTest();
        ConnectedAppPlugin  cap = new ConnectedAppPlugin();
        Id connectedAppId = '06P2w000000SVzK';
        Map<String,String> respMapStr = cap.customAttributes(UserInfo.getUserId(),connectedAppId,mapstr,NULL);
        Test.stopTest();
        
        Map<String,String> mapstrempty = new Map<String,String>();
        System.assertNotEquals(respMapStr,mapstrempty);
        
    }
}