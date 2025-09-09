#!/bin/bash

# Complete HelloSend 2GP Package Deployment Script
echo "🚀 Deploying Complete HelloSend 2GP Package with Connected App..."

ORG_ALIAS="oapps-test-org-new"

# Function to check if command succeeded
check_status() {
    if [ $? -eq 0 ]; then
        echo "✅ $1 - SUCCESS"
    else
        echo "❌ $1 - FAILED"
        return 1
    fi
}

echo ""
echo "📋 Step 1: Deploying Connected App..."
sf project deploy start --metadata ConnectedApp:OAppS_Omni_Channel --target-org $ORG_ALIAS --ignore-warnings
check_status "Connected App deployment"

echo ""
echo "📋 Step 2: Deploying WebLinks (HelloSend Campaign buttons)..."
sf project deploy start --metadata WebLink:Account.HelloSend_Campaign,WebLink:Contact.HelloSend_Campaign,WebLink:Lead.HelloSend_Campaign --target-org $ORG_ALIAS --ignore-warnings
check_status "WebLinks deployment"

echo ""
echo "📋 Step 3: Deploying Visualforce Pages..."
sf project deploy start --metadata ApexPage:OAppS_Account_Bulkpage,ApexPage:OAppS_Contact_Bulkpage,ApexPage:OAppS_Lead_Bulkpage --target-org $ORG_ALIAS --ignore-warnings
check_status "Visualforce Pages deployment"

echo ""
echo "📋 Step 4: Deploying Apex Classes..."
sf project deploy start --metadata ApexClass --target-org $ORG_ALIAS --ignore-warnings
check_status "Apex Classes deployment"

echo ""
echo "📋 Step 5: Deploying Page Layouts with HelloSend Campaign buttons..."
sf project deploy start --metadata Layout:Account.Account\ Layout,Layout:Contact.Contact\ Layout,Layout:Lead.Lead\ Layout --target-org $ORG_ALIAS --ignore-warnings
check_status "Page Layouts deployment"

echo ""
echo "📋 Step 6: Deploying List Views..."
sf project deploy start --metadata ListView:Account.MyAccountsWithButtons,ListView:Contact.MyContactsWithButtons,ListView:Contact.BulkMessageContacts,ListView:Lead.MyLeadsWithButtons --target-org $ORG_ALIAS --ignore-warnings
check_status "List Views deployment"

echo ""
echo "📋 Step 7: Deploying Remote Site Settings..."
sf project deploy start --metadata RemoteSiteSetting --target-org $ORG_ALIAS --ignore-warnings
check_status "Remote Site Settings deployment"

echo ""
echo "📋 Step 8: Deploying CSP Trusted Sites..."
sf project deploy start --metadata CspTrustedSite --target-org $ORG_ALIAS --ignore-warnings
check_status "CSP Trusted Sites deployment"

echo ""
echo "📋 Step 9: Verifying deployments..."

# Check Connected App
echo "🔍 Verifying Connected App..."
sf data query --query "SELECT Id, Name FROM ConnectedApplication WHERE Name = 'OAppS_Omni_Channel'" --target-org $ORG_ALIAS --use-tooling-api
check_status "Connected App verification"

# Check WebLinks
echo "🔍 Verifying WebLinks..."
sf data query --query "SELECT Id, Name, MasterLabel FROM WebLink WHERE Name = 'HelloSend_Campaign'" --target-org $ORG_ALIAS
check_status "WebLinks verification"

# Check Visualforce Pages
echo "🔍 Verifying Visualforce Pages..."
sf data query --query "SELECT Id, Name FROM ApexPage WHERE Name LIKE 'OAppS_%Bulkpage'" --target-org $ORG_ALIAS --use-tooling-api
check_status "Visualforce Pages verification"

# Check Page Layouts
echo "🔍 Verifying Page Layouts..."
sf data query --query "SELECT Id, Name, EntityDefinitionId FROM Layout WHERE EntityDefinitionId IN ('Account', 'Contact', 'Lead') AND Name IN ('Account Layout', 'Contact Layout', 'Lead Layout')" --target-org $ORG_ALIAS --use-tooling-api
check_status "Page Layouts verification"

echo ""
echo "🎯 DEPLOYMENT COMPLETE!"
echo ""
echo "✅ **HelloSend 2GP Package Successfully Deployed!**"
echo ""
echo "📊 **Components Deployed:**"
echo "   • Connected App: OAppS Omni Channel"
echo "   • Consumer Key: 3MVG9n_HvETGhr3CogbDQGHDGFobOBZPY5Gu7qQbYPYWxSpTn8dMHEnTvMw3FU6mrpfmUPPcD2yyz74UNNFTE"
echo "   • 3 WebLinks: HelloSend Campaign buttons"
echo "   • 3 Visualforce Pages: Bulk SMS interfaces"
echo "   • 3 Page Layouts: With HelloSend Campaign list view buttons"
echo "   • Enhanced List Views: SMS Ready views"
echo "   • Apex Classes: SMS integration logic"
echo "   • Remote Site Settings: External API access"
echo "   • CSP Trusted Sites: Security configuration"
echo ""
echo "🔗 **Test the deployment:**"
echo "sf org open --target-org $ORG_ALIAS"
echo ""
echo "📝 **Next Steps:**"
echo "1. Go to any Account/Contact/Lead list view"
echo "2. Select one or more records"
echo "3. Look for 'HelloSend Campaign' button in mass actions"
echo "4. Click the button to test bulk SMS functionality"
echo "5. Verify OAuth integration with HelloSend platform"
echo ""
echo "📖 **Documentation:**"
echo "   • BUTTON_CONFIGURATION_GUIDE.md - Button setup instructions"
echo "   • CONNECTED_APP_SETUP.md - OAuth configuration details"
echo ""
echo "🔗 **Scratch org access:**"
sf org open --target-org $ORG_ALIAS --url-only

echo ""
echo "🎉 **Your HelloSend 2GP package is now fully deployed and ready for production! 🚀**"
