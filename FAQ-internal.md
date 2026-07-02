# BU tiCrypt — Internal Admin FAQ

Frequently asked questions for BU Research Computing Services staff and system administrators managing the BU tiCrypt deployment.

---

## Table of Contents

- [General](#general)
- [User Account Management](#user-account-management)
- [Connecting to POC Deployment](#connecting-to-poc-deployment)
- [Using the VM](#using-the-vm)
- [BU Deployment Specifics & Limitations](#bu-deployment-specifics--limitations)
- [Policy](#policy)
- [RCS Support](#rcs-support)


---

## General

**Q: What is the scope of what tiCrypt is trying to secure?**

To Be Answered

---

## User Account Management

**Q: When I log into tiCrypt, a notice appeared indicating permissions have changed on my account. What does this mean?**

To Be Answered

---

**Q: When I logged into tiCrypt, a message appeared indicating I had a failed login attempt. What should I do?**

To Be Answered

---

**Q: What if I forgot my password?**

To Be Answered

---

**Q: I lost my private key file, what do I do?**

To Be Answered

---

**Q: Where should users store their private key JSON file?**

**macOS:** To Be Answered

**Windows:** To Be Answered

**Linux:** To Be Answered

---

**Q: Can I use the same private key JSON file to log in from a different computer or operating system? (e.g., started on a Linux machine and now need to log in from a Windows laptop)**

To Be Answered

- Is it technically possible?
- What is the recommendation for this scenario?

---

## Connecting to POC Deployment

**Q: When I open the tiCrypt application, it says "Loading...." but appears frozen. What is wrong?**

The tiCrypt application may not be able to connect to the servers. Make sure you are on the BU network or using VPN before opening the application. After connecting to the VPN, if you are using a Windows machine, you may need to terminate the tiCrypt application using the Task Manager and restart the application before it detects the VPN connection.

---

## Using the VM

**Q: How do I get added to a VM?**

To Be Answered

For reference Andy & Yun were added to the VM by Augustine. Two steps:
1. Users are added to the VM
2. Apply additional permissions template to your accounts

> Be sure to reload the ticrypt application for it to take affect

**Q: How do I access the Remote Desktop?**

Starting Remote Desktop via web application (127.0.0.1:8080) is not supported.  Use the TiCrypt Desktop application.

**macOS:**

**What you'll need:** Windows App installed on your Mac

1. Log in to tiCrypt and access your VM
2. Click **Start Remote Desktop** — this will:
   - Open an **Instructions for VM** dialog containing your login credentials and a **Download RDP File** button
   - Launch the Windows App application
3. In the **Instructions for VM** dialog, click **Download RDP File** and save it to your computer
4. In Windows App:
   - Go to **Connections > Import from RDP File**, navigate to the saved `.rdp` file, and click **Import**
   - The VM will appear under **Saved Devices** — click the ellipsis (**...**) to connect
5. When prompted for a password, return to the **Instructions for VM** dialog, click **Copy Password**, and paste it into the password field
6. When asked to confirm the connection, click **Continue**
7. The remote desktop will open

> When finished, disconnect from the VM via the Windows App Connection Center, then delete the `.rdp` file from your computer

**Linux:** To Be Answered

**Windows:** There is an open issue investigating problems with the native RDP tool — see [GitHub Issue #3](https://github.com/katgit/BU-tiCrypt/issues/3) for updates.
- Yun's instructions for [Windows Remote Desktop setup](https://docs.google.com/document/d/1akM_C1k1RuConJPDTSzf_32xFlid1zk0/edit?usp=drive_link&ouid=112727426210481795582&rtpof=true&sd=true).

---

**Q: How do I copy and paste in the terminal connected to a VM?**

**macOS & Linux:** Highlight the text in the terminal you want to copy, then use the File menu to select Copy. Use the File menu to Paste.

**Windows:** The top menu does not exist in the terminal, so the above solution does not work.

**Alternative (all platforms):** While tiCrypt is open, open a browser and go to `http://127.0.0.1:8080/`. This will open a tiCrypt interface within your browser. Connect to the terminal for the VM — you should now be able to right-click to access copy and paste functions.

---

**Q: Can one access data in the "vault" from the terminal on the VM? Or does one need to use the tiCrypt transfer tool?**

To Be Answered

---

**Q: Where should the project files be stored on the VM?**

To Be Answered

---

### Troubleshooting

**Q: The tiCrypt application is running but the VM connection isn't working. I see the VM listed with a red status indicator.**

When attempting to connect, the connection stalls indefinitely and does not complete. Restart the local machine, reopen the tiCrypt application and try to connect to the VM.

---

## BU Deployment Specifics & Limitations

**Q: Can users connect the File Transfer Hub to external cloud storage (S3, Google Drive, etc.)?**

No, the transfer tools are currently disabled.

---

## Policy

**Q: Are there restrictions on what machine I can use to access tiCrypt? For example, should I only use a BU-owned machine, or is a personal laptop OK?**

To Be Answered

---

**Q: What software is allowed to be installed on the VMs? Are Singularity or Docker containers allowed?**

To Be Answered

---

## RCS Support

**Q: If a researcher needs help troubleshooting a workflow on tiCrypt, can the RCS team request screenshots of the issue or error messages via ServiceNow or email?**

Yes — screenshots of issues and error messages can be requested via ServiceNow or email. However, be careful not to expose sensitive data; avoid requesting screenshots that show open data files. *(Answered by Katia Bulekova, 2026-05-12)*

---

**Q: Is a Zoom call with screenshare allowed for troubleshooting?**

Yes. *(Answered by Katia Bulekova, 2026-05-12)*

---

**Q: Can the RCS team "beuser" (impersonate) a researcher's account to assist with troubleshooting?**

No. Only members of a project have full access to that project's data and VM. Everyone else — including the Appsteam and members of other projects — are considered "outsiders" and will not have access. Each project has its own VM accessible only to its members. *(Answered by Katia Bulekova, 2026-05-12)*
