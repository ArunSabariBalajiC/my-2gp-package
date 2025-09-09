#!/bin/bash

# Configure HelloSend Campaign Buttons Script
echo "🚀 Configuring HelloSend Campaign buttons in list views..."

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
echo "📋 Step 1: Verifying WebLinks are deployed..."
sf data query --query "SELECT Id, Name, MasterLabel FROM WebLink WHERE Name = 'HelloSend_Campaign'" --target-org $ORG_ALIAS
check_status "WebLink verification"

echo ""
echo "📋 Step 2: Creating enhanced list views with proper configurations..."

# Deploy new list views
sf project deploy start --metadata ListView:Contact.MyContactsWithButtons --target-org $ORG_ALIAS --ignore-warnings
check_status "Contact list view deployment"

sf project deploy start --metadata ListView:Account.MyAccountsWithButtons --target-org $ORG_ALIAS --ignore-warnings  
check_status "Account list view deployment"

sf project deploy start --metadata ListView:Lead.MyLeadsWithButtons --target-org $ORG_ALIAS --ignore-warnings
check_status "Lead list view deployment"

echo ""
echo "📋 Step 3: Verifying list views are created..."
sf data query --query "SELECT DeveloperName, Name, SobjectType FROM ListView WHERE DeveloperName LIKE '%WithButtons%'" --target-org $ORG_ALIAS
check_status "List view verification"

echo ""
echo "🎯 NEXT STEPS FOR MANUAL CONFIGURATION:"
echo "1. Open the scratch org: sf org open --target-org $ORG_ALIAS"
echo "2. Go to Contacts → Any List View"
echo "3. Select records and look for 'HelloSend Campaign' button"
echo "4. If not visible, click Settings (⚙️) → Select List Display → Enable 'HelloSend Campaign'"
echo "5. Repeat for Accounts and Leads"

echo ""
echo "🔗 Scratch org access:"
sf org open --target-org $ORG_ALIAS --url-only
