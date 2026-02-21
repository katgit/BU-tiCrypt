# BU tiCrypt Onboarding Guide

Comprehensive documentation for setting up and accessing tiCrypt at Boston University.

---

## Table of Contents
- [Prerequisites](#prerequisites)
- [Installation Steps](#installation-steps)
  - [1. Download Required Files](#1-download-required-files)
  - [2. Install tiCryptConnect](#2-install-ticryptconnect)
  - [3. Initial Setup](#3-initial-setup)
  - [4. Create User Account](#4-create-user-account)
  - [5. Administrator Approval](#5-administrator-approval)
  - [6. Complete Registration](#6-complete-registration)
- [First Login](#first-login)
- [Troubleshooting](#troubleshooting)
- [Additional Resources](#additional-resources)

---

## Prerequisites

**Network Connection:** You must be connected to the BU Network to access tiCrypt.

- **On Campus:** Connect directly to the BU Network
- **Off Campus:** Use [Cisco Secure Client with Two-Factor Authentication](https://www.bu.edu/tech/services/cccs/remote/vpn/two-factor-vpn/) to establish a VPN connection

---

## Installation Steps

### 1. Download Required Files

#### tiCryptConnect Application

Download the appropriate version for your operating system:

| Operating System | Download Link |
|-----------------|---------------|
| **macOS** | [tiCryptConnect-4.0.16.pkg](https://storage.googleapis.com/ticrypt/connect/stable/4.0.16/tiCryptConnect-4.0.16.pkg) |
| **Windows** | [tiCryptConnectInstaller-4.0.16.exe](https://storage.googleapis.com/ticrypt/connect/stable/4.0.16/tiCryptConnectInstaller-4.0.16.exe) |
| **Linux** | [tiCryptConnect_v4.0.16_linux_amd64](https://storage.googleapis.com/ticrypt/connect/stable/4.0.16/tiCryptConnect_v4.0.16_linux_amd64) |

#### BU Deployment File

Download the [BU Deployment file (deployment-bu.dep)](https://storage.googleapis.com/ticrypt/deployments/deployment-bu.dep)

> **Important:** Save this file in a secure, memorable location on your computer. You will need it during the initial setup.

---

### 2. Install tiCryptConnect

1. Run the installer you downloaded for your operating system
2. Follow the installation prompts
3. When you see the "Installation was successful" message, close the window
4. Launch the tiCryptConnect application:
   - **Windows:** Use the Start menu
   - **macOS:** Open from the Applications folder
   - **Linux:** Run from your applications menu or terminal

---

### 3. Initial Setup

When you first launch tiCryptConnect:

1. Click the **"Upload .dep file"** button
2. Select and upload the **deployment-bu.dep** file you downloaded earlier
3. Wait for the latest version of tiCrypt to install automatically
4. Review the patch notes in the pop-up window, then close it

You should now see the BU tiCrypt Deployment screen:

<img width="320" height="278" alt="BU tiCrypt Deployment window showing Launch button" src="https://github.com/user-attachments/assets/c3fe7f06-fd25-400a-8f3b-b88197f75fdb" />

5. Click the **"Launch BU tiCrypt Deployment"** button

---

### 4. Create User Account

<img width="353" height="380" alt="Create User Account interface" src="https://github.com/user-attachments/assets/0a467c6a-f6cf-4487-82ee-dfc76fc18ded" />

1. Click the green **"Create User Account"** button
2. Fill in your information:
   - **Login ID:** Enter your BU email address (e.g., `rbrown@bu.edu`)
   - **First Name:** Your first name
   - **Last Name:** Your last name
3. Click the blue **"Continue to Password"** button

#### Set Your Password

1. Create a **new password** for tiCrypt
   > **Important:** Do **NOT** use your BU Kerberos password. Choose a unique password and store it securely.
2. Click the blue **"Continue to optional information"** button

#### Complete Your Profile

1. Fill in additional information:
   - Department
   - Position
   - Other relevant details
2. Click the blue **"Review account"** button

> **Note:** Your account now requires approval from a System Administrator before you can proceed.

---

### 5. Administrator Approval

**For System Administrators:**

When a new user registers, they will appear in the user list marked as "not active."

To activate a new user:

1. Right-click on the user's name
2. **Assign a role** (e.g., regular user, administrator)
3. **Change state to active:**
   - Select "Change State" from the context menu
   - Set the user status to "Active"

<img width="1105" height="523" alt="User management interface showing Change State option" src="https://github.com/user-attachments/assets/e5578804-4586-4df0-a230-b850143b9b3c" />

**For New Users:**

Wait for notification that your account has been activated before proceeding to the next step.

---

### 6. Complete Registration

Once activated by an administrator:

1. Click the **"Finish registration"** button
2. Download your **private key JSON file** when prompted

<img width="624" height="546" alt="Download private key JSON file interface" src="https://github.com/user-attachments/assets/7fe3b2e3-927f-4a0c-ae19-a722d741e864" />

> **Critical:** This JSON file contains your private encryption key. Store it securely - you will need it for every login. If you lose this file, you may lose access to encrypted data.

3. Click the blue **"Continue to tiCrypt"** button

---

## First Login

<img width="381" height="369" alt="Load Key interface" src="https://github.com/user-attachments/assets/aadbdcc8-3489-4970-a7a2-32c880fa9e75" />

1. When prompted that you have no keys loaded, click the **"Load Key"** button
2. Select and upload the **JSON file** you downloaded during registration
3. Enter your **tiCrypt password** (the one you created during account setup)
4. Click **"Login"**

You should now have access to BU tiCrypt!

---

## Troubleshooting

### Connection Issues
- **Problem:** Cannot connect to tiCrypt
- **Solution:** Verify you are connected to the BU Network or VPN

### Lost JSON Key File
- **Problem:** Cannot locate your private key JSON file
- **Solution:** Contact your System Administrator to regenerate your key (you may lose access to previously encrypted data)

### Password Issues
- **Problem:** Forgot tiCrypt password
- **Solution:** Contact your System Administrator for password reset procedures

### Installation Errors
- **Problem:** tiCryptConnect fails to install
- **Solution:** 
  - Ensure you have administrator privileges on your computer
  - Check that your OS meets the minimum requirements
  - Contact IS&T support if issues persist

---

## Additional Resources

- [tiCrypt Official Documentation](https://ticrypt.com/docs/ticrypt-guidelines-to/registration/)
- [BU Research Computing Services](https://www.bu.edu/tech/support/research/)
- For technical support, contact: [help@scc.bu.edu](mailto:help@scc.bu.edu)

---

**Last Updated:** [2026-02-21]  
**Maintained by:** BU Research Computing Services

