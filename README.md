# BU-tiCrypt
Notes related to onboarding and using tiCrypt at Boston University


## Prerequisites

To work with BU *tiCrypt*, make sure you are connected to BU Network. Outside of the BU Campus, use [Cisco Secure Client with Two-Factor Authentication](https://www.bu.edu/tech/services/cccs/remote/vpn/two-factor-vpn/) to connect to the BU Network


## Downloads

Download the **tiCryptConnect** App:
- for Mac: [https://storage.googleapis.com/ticrypt/connect/stable/4.0.16/tiCryptConnect-4.0.16.pkg](https://storage.googleapis.com/ticrypt/connect/stable/4.0.16/tiCryptConnect-4.0.16.pkg)
- for Windows: [https://storage.googleapis.com/ticrypt/connect/stable/4.0.16/tiCryptConnectInstaller-4.0.16.exe](https://storage.googleapis.com/ticrypt/connect/stable/4.0.16/tiCryptConnectInstaller-4.0.16.exe)
- for Linux: [https://storage.googleapis.com/ticrypt/connect/stable/4.0.16/tiCryptConnect_v4.0.16_linux_amd64](https://storage.googleapis.com/ticrypt/connect/stable/4.0.16/tiCryptConnect_v4.0.16_linux_amd64)

Download the **BU Deployment** file:[https://storage.googleapis.com/ticrypt/deployments/deployment-bu.dep](https://storage.googleapis.com/ticrypt/deployments/deployment-bu.dep)
Save this file in a secure place on your computer. This *BU Deployment* file will be used later during the *tiCryptConnect* Setup

## Install the *tiCryptConnect* App 

Install the *tiCryptConnect* App (using the installer you downloaded from the appropriate link above) on your local computer. Once the application is installed, you will see a window with a message *"The Installation was successful."* Close this window.
Start the *tiCryptConnect* App (use the Start button on Windows computers or find it in "Applications" folder on Mac).

## *tiCryptConnect* Setup

The first time you start the *tiCryptConnect* application, you will see a Window with a single button "Upload .dep file". Click this button and upload the **BU Deployment** file you downloaded earlier. Once the file is uploaded, the newest version of the tiCrypt will be installed. Once the installation is finished, you will see a pop-up window notifying you what version of the tiCrypt was installed and listing patch notes. Close this window.

At this point, you should see a window below. 

<img width="320" height="278" alt="BUtiCryptDeployment" src="https://github.com/user-attachments/assets/c3fe7f06-fd25-400a-8f3b-b88197f75fdb" />
<br clear="all">

Click the *Launch BU tiCrypt Deployment* button.

At this point you will see a window that looks like the one below:

<img width="353" height="380" alt="CreateUserAccount" src="https://github.com/user-attachments/assets/0a467c6a-f6cf-4487-82ee-dfc76fc18ded" />
<br clear="all">

Click the *Create User Account* button (green).

On the form that appears, you enter your __BU email address__ in the **login ID** field  (e.g. rbrown@bu.edu). Enter your First and Last names and click the blue *Continue to Password* button.

In the following window, you will be asked to set up your *tiCrypt* password. Enter a new password (do **not** use your BU Kerberos password). Make sure you remember it, as you will use it every time you connect to BU tiCrypt.

Click the blue *Continue to optional information* button. Fill in the information about yourself (Department, Position, etc.). Click the blue *Review account* button.

## User Approval by the System Administrator

At this point, the System Administrator will see the name of a new user appearing in the list of tiCrypt users. The user will be marked as *not active*. 
The System Administrator need right-click on the name of the user and 
1. Assign an appropriate role (regular user, administrator, etc.).
2. Assign the "active" status to the user (select "change state" in the menu).

<img width="1105" height="523" alt="ChangeState" src="https://github.com/user-attachments/assets/e5578804-4586-4df0-a230-b850143b9b3c" />


## Donwloading the *json* file

Once the System Administrator activates the user, the user can click the *Finish registration* button. The system will prompt you to download a **json** file with a private key. Download and save this file in a safe place on your computer. You will need this file later:

<img width="624" height="546" alt="JSONPrivateKey" src="https://github.com/user-attachments/assets/7fe3b2e3-927f-4a0c-ae19-a722d741e864" />
<br clear="all">

Click the blue *Continue to tiCrypt* button. The next screen will tell you that you have no keys loaded. Click the **Load Key** button and load the **json** file you downloaded earlier.

<img width="381" height="369" alt="LoadJSON" src="https://github.com/user-attachments/assets/aadbdcc8-3489-4970-a7a2-32c880fa9e75" />
<br clear="all">

Once you upload your **json** file, you will be asked to enter your **tiCrypt password** (that you created earlier) and then click **Login**.





