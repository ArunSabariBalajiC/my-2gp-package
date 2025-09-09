# 🔗 HelloSend Connected App Configuration Guide

## Overview
The HelloSend 2GP package now includes the **OAppS Omni Channel** Connected App with proper OAuth configuration for secure integration with the HelloSend SMS platform. This Connected App replaces the old 1GP package version and includes updated callback URLs and security settings.

## Package Information
- **Main Package Version**: `04tdN000000F7pBQAS` (Version 1.0.0.3)
- **Installation URL**: `https://login.salesforce.com/packaging/installPackage.apexp?p0=04tdN000000F7pBQAS`

## ✅ Connected App Details

The Connected App is **automatically deployed** with the 2GP package and includes:

### Basic Information
- **Name**: `OAppS_Omni_Channel`
- **Label**: "OAppS Omni Channel"
- **Contact Email**: sabari@oapps.xyz
- **Consumer Key**: `3MVG9n_HvETGhr3CogbDQGHDGFobOBZPY5Gu7qQbYPYWxSpTn8dMHEnTvMw3FU6mrpfmUPPcD2yyz74UNNFTE`

### OAuth Configuration

#### Callback URLs (Multiple environments supported)
- **Development**: `http://localhost:7000/api/v1/redirect`
- **Staging**: `https://fun-scarcely-grackle.ngrok-free.app/api/v2/app/redirect`
- **Production**: `https://server5.rekzyl.com/api/v2/app/redirect`

#### OAuth Scopes
- **Full** - Complete access to Salesforce data
- **RefreshToken** - Ability to refresh expired access tokens

#### OAuth Policies
- **Permitted Users**: Admin approved users are pre-authorized
- **IP Relaxation**: Enforce IP restrictions
- **Refresh Token Policy**: Refresh token is valid until revoked

### Step 2: Configure OAuth Settings
1. After creating the Connected App, note down:
   - **Consumer Key** (will be auto-generated)
   - **Consumer Secret** (click to reveal)

2. Update your application configuration with the new Consumer Key and Secret

### Step 3: Update Code References (If Necessary)
If your code references the Connected App by name or consumer key, update the following files with the new values:

- Check Apex classes for hardcoded consumer keys
- Update any custom settings or metadata that reference the Connected App

### Step 4: Test Integration
1. Test the OAuth flow with your external application
2. Verify that SMS functionality works correctly
3. Check that all API calls authenticate successfully

## Security Considerations
- **Never commit Consumer Secrets to version control**
- **Use Custom Settings or Custom Metadata Types** to store OAuth credentials
- **Implement proper error handling** for OAuth failures
- **Consider using Named Credentials** for secure credential management

## Troubleshooting
- If OAuth fails, verify callback URLs match exactly
- Ensure the Connected App is activated and approved for users
- Check that Remote Site Settings are properly configured
- Verify IP restrictions if authentication fails

## Alternative Approach: Named Credentials
For better security and easier deployment, consider using **Named Credentials** instead of direct OAuth:

1. Create a Named Credential in Setup
2. Configure it to use the Connected App
3. Update your Apex code to use the Named Credential for callouts

This approach allows for easier package deployment and better credential management.

## Files Provided
The Connected App metadata file is provided separately as:
- `HelloSend_Omni_Channel.connectedApp-meta.xml`

This file can be deployed manually using:
```bash
sf project deploy start --metadata ConnectedApp:HelloSend_Omni_Channel --target-org YOUR_ORG_ALIAS
```

**Note**: Remove any existing `consumerKey` elements from the file before deployment to allow Salesforce to generate a new unique consumer key.
