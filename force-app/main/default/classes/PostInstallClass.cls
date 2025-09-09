global class PostInstallClass implements InstallHandler {
  global static void onInstall(InstallContext context) {
    System.debug(' context >>>>>>>>>>>>>>' + context.previousVersion());
    if (context.isUpgrade() == false) {
      // Make callout to your server
      Http http = new Http();
      HttpRequest req = new HttpRequest();

      // Use your API endpoint
      req.setEndpoint(
        'https://fun-scarcely-grackle.ngrok-free.app/api/v2/app/redirect'
      );
      req.setMethod('POST');
      req.setHeader('Content-Type', 'application/json');

      // Prepare installation data payload
      Map<String, String> payload = new Map<String, String>{
        'orgId' => context.organizationId(),
        'companyId' => context.organizationId(),
        'userId' => context.installerId(),
        'installType' => context.isPush() ? 'PushUpgrade' : 'Standard'
      };

      req.setBody(JSON.serialize(payload));

      try {
        HttpResponse res = http.send(req);

        // Check response status
        if (res.getStatusCode() != 200) {
          System.debug('Callout failed: ' + res.getBody());
        }
      } catch (Exception e) {
        System.debug('Error making callout: ' + e.getMessage());
      }
    }
  }
}
