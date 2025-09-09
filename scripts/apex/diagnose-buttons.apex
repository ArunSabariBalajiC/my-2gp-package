// Apex Script to Diagnose HelloSend Campaign Button Configuration
// Execute this in the Developer Console or via SF CLI

System.debug('=== HelloSend Campaign Button Diagnostic ===');

// Check WebLinks deployment
List<WebLink> webLinks = [SELECT Id, Name, MasterLabel, Url, DisplayType, LinkType 
                         FROM WebLink 
                         WHERE Name = 'HelloSend_Campaign'];

System.debug('Found WebLinks: ' + webLinks.size());
for(WebLink wl : webLinks) {
    System.debug('WebLink: ' + wl.Name + ' | Label: ' + wl.MasterLabel + ' | Type: ' + wl.DisplayType + ' | URL: ' + wl.Url);
}

// Check if Visualforce pages exist
List<ApexPage> pages = [SELECT Name, MasterLabel FROM ApexPage WHERE Name LIKE 'OAppS_%Bulkpage'];
System.debug('Found Visualforce Pages: ' + pages.size());
for(ApexPage page : pages) {
    System.debug('VF Page: ' + page.Name + ' | Label: ' + page.MasterLabel);
}

// Check List Views
List<ListView> listViews = [SELECT Id, Name, DeveloperName, SobjectType 
                           FROM ListView 
                           WHERE SobjectType IN ('Account', 'Contact', 'Lead')
                           ORDER BY SobjectType, DeveloperName];

System.debug('Available List Views: ' + listViews.size());
for(ListView lv : listViews) {
    System.debug('ListView: ' + lv.SobjectType + '.' + lv.DeveloperName + ' | Name: ' + lv.Name);
}

System.debug('=== End Diagnostic ===');
System.debug('Next Steps:');
System.debug('1. WebLinks should show DisplayType = M (Mass Action)');
System.debug('2. All three VF pages should be present');
System.debug('3. If buttons not visible, configure manually in Lightning Experience');
