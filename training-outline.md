# tiCrypt User Training Outline

A guide for trainers and content creators covering the key concepts
users need to start using tiCrypt at Boston University.

---

## 1. What Is tiCrypt and Why Use It?
- Definition: encrypted, isolated computing environment for sensitive research data
- Who it is for: researchers handling protected/regulated data (e.g., HIPAA, IRB)
- Key difference from the SCC: tiCrypt is not a general HPC cluster — it is a
  secure enclave with strict access controls

## 2. BU SCC vs. tiCrypt: High-Level Comparison

Both the SCC and tiCrypt are BU Research Computing resources, but they serve different purposes and work differently.

| | BU SCC | tiCrypt |
|---|---|---|
| **Purpose** | General-purpose HPC cluster | Secure enclave for sensitive/regulated data (HIPAA, IRB) |
| **How you access it** | Multiple options: OnDemand (web browser), SSH | Strictly through the tiCryptConnect application |
| **Authentication** | BU Kerberos login + Duo 2FA | tiCrypt-specific password + private key JSON file |
| **Job scheduler** | SGE (Sun Grid Engine) | SLURM (Simple Linux Utility for Resource Management) |
| **User-specific storage** | Home directory | Vault |
| **Network requirement** | Not required | BU network or VPN required |
| **Who it is for** | Any BU researcher needing compute resources | Researchers working with protected/regulated data |

## 3. Prerequisites Before You Can Access tiCrypt
- Must be on the BU network (on campus or VPN with 2FA)
- You will need: local admin rights on your computer to install tiCryptConnect
- Who to contact to get started: your PI or project administrator

## 4. Installation: tiCryptConnect and the Deployment File
- What tiCryptConnect is: the client application that connects you to BU's tiCrypt deployment
- Two downloads required:
  - tiCryptConnect installer (OS-specific)
  - BU deployment file (`deployment-bu.dep`) — ties the client to BU's instance
- Walk through: install → launch → upload .dep file → launch BU deployment

## 5. Account Creation
- Register with your BU email as your Login ID
- Create a tiCrypt-specific password — do NOT use your Kerberos (BU login) password
- Fill in profile fields (department, position)
- Account is not active until approved by an administrator — what to expect

## 6. Your Private Key JSON File (Critical Concept)
- What it is: a file that holds your personal encryption key
- Where to store it: secure, backed-up location — keep it safe
- Every login requires this file

## 7. Logging In
- Step-by-step: Load Key → select your JSON file → enter tiCrypt password → Login
- Common issue: application shows "Loading..." → check VPN/network connection first

## 8. Navigating the tiCrypt Interface
- Overview of the main areas: file vault, VM access, user/project management
- Project-based access model: each project has its own isolated environment and VM
- How to know which project(s) you belong to

## 9. Working with Data
- Uploading data to the vault
- Downloading/accessing data from within tiCrypt
- Current BU limitations: external cloud storage (S3, Google Drive) transfer tools are disabled
- Recommended workflow for moving data in and out

## 10. Working with the Virtual Machine (VM)
- What the VM is and how it relates to your project
- How to request VM access (contact your project administrator)
- Accessing the remote desktop (Windows App on macOS; platform-specific notes)
- Using the VM terminal: copy/paste tips (File menu or browser interface at 127.0.0.1:8080)
- When you are done: disconnect from VM and delete the local .rdp file

## 11. Submitting Jobs
- tiCrypt uses the SLURM scheduler (note: this differs from the SCC, which uses SGE)
- *Details to be filled in*

## 12. Security Responsibilities and Policies
- Users are responsible for safeguarding their private key and tiCrypt password
- Do not share credentials or allow others to use your account
- Non-BU work computers: check with your administrator whether they are permitted
- Screenshots and screenshares with RCS support: allowed (avoid exposing open data files)

## 13. Troubleshooting Common Issues
- Cannot connect: verify BU network or VPN; on Windows, restart the application after connecting VPN
- Forgot tiCrypt password: contact your administrator
- Installation fails: verify local admin rights; check OS compatibility

## 14. Getting Help
- BU RCS support: help@scc.bu.edu
- ServiceNow tickets for ongoing issues
- Zoom screenshare with RCS is permitted for troubleshooting
- Official tiCrypt documentation: ticrypt.com/docs
