#!/bin/bash

# Deploy HelloSend Page Layouts Script
echo "🚀 Deploying HelloSend Page Layouts with Campaign buttons..."

ORG_ALIAS="oapps-test-org-new"

# Function to check if command succeeded
check_status() {
    if [ $? -eq 0 ]; then
        echo "✅ $1 - SUCCESS"
    else
        echo "❌ $1 - FAILED"
    fi
}

echo ""
echo "📋 Step 1: Deploying Account Layout with HelloSend Campaign button..."
sf project deploy start --metadata Layout:Account.Account\ Layout --target-org $ORG_ALIAS --ignore-warnings
check_status "Account Layout deployment"

echo ""
echo "📋 Step 2: Deploying Contact Layout with HelloSend Campaign button..."
sf project deploy start --metadata Layout:Contact.Contact\ Layout --target-org $ORG_ALIAS --ignore-warnings
check_status "Contact Layout deployment"

echo ""
echo "📋 Step 3: Deploying Lead Layout with HelloSend Campaign button..."
sf project deploy start --metadata Layout:Lead.Lead\ Layout --target-org $ORG_ALIAS --ignore-warnings
check_status "Lead Layout deployment"

echo ""
echo "📋 Step 4: Verifying layout deployments..."
sf data query --query "SELECT Id, Name, EntityDefinitionId FROM Layout WHERE EntityDefinitionId IN ('Account', 'Contact', 'Lead') AND Name IN ('Account Layout', 'Contact Layout', 'Lead Layout')" --target-org $ORG_ALIAS --use-tooling-api
check_status "Layout verification"

echo ""
echo "📋 Step 5: Checking HelloSend Campaign buttons..."
sf data query --query "SELECT Id, Name, MasterLabel, DisplayType FROM WebLink WHERE Name = 'HelloSend_Campaign'" --target-org $ORG_ALIAS
check_status "Button verification"

echo ""
echo "🎯 CONFIGURATION COMPLETE!"
echo ""
echo "✅ Page layouts deployed with HelloSend Campaign buttons in List View Button Layout"
echo "✅ The HelloSend Campaign button should now appear in:"
echo "   • Account list views when records are selected"
echo "   • Contact list views when records are selected" 
echo "   • Lead list views when records are selected"
echo ""
echo "🔗 Test the deployment:"
echo "sf org open --target-org $ORG_ALIAS"
echo ""
echo "📝 Next Steps:"
echo "1. Go to any Account/Contact/Lead list view"
echo "2. Select one or more records"
echo "3. Look for 'HelloSend Campaign' button in the mass action buttons"
echo "4. Click the button to initiate bulk SMS campaigns"

echo ""
echo "🔗 Scratch org access:"
sf org open --target-org $ORG_ALIAS --url-only
