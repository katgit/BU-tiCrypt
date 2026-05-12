# BU tiCrypt — Internal Admin FAQ

Frequently asked questions for BU Research Computing Services staff and system administrators managing the BU tiCrypt deployment.

---

## Table of Contents

- [General](#general)
- [User Account Management](#user-account-management)
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

## Using the VM

**Q: How do I access the Remote Desktop?**

**macOS:** To Be Answered

**Linux:** To Be Answered

**Windows:** There is an open issue investigating problems with the native RDP tool — see [GitHub Issue #3](https://github.com/katgit/BU-tiCrypt/issues/3) for updates.

---

**Q: How do I copy and paste in the terminal connected to a VM?**

**macOS & Linux:** Highlight the text in the terminal you want to copy, then use the File menu to select Copy. Use the File menu to Paste.

**Windows:** The top menu does not exist in the terminal, so the above solution does not work.

**Alternative (all platforms):** While tiCrypt is open, open a browser and go to `http://127.0.0.1:8080/`. This will open a tiCrypt interface within your browser. Connect to the terminal for the VM — you should now be able to right-click to access copy and paste functions.

---

**Q: Can one access data in the "vault" from the terminal on the VM? Or does one need to use the tiCrypt transfer tool?**

To Be Answered

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

To Be Answered

---

**Q: Is a Zoom call with screenshare allowed for troubleshooting?**

To Be Answered

---

**Q: Can the RCS team "beuser" (impersonate) a researcher's account to assist with troubleshooting?**

To Be Answered
