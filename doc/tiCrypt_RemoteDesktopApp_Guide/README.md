# tiCrypt Remote Desktop App Instructions for Windows

## Step-by-Step

#### Step 1: Start Remote Desktop

Click **Start Remote Desktop** from the right-side menu of your VM.

![Start Remote Desktop menu](images/start-remote-desktop-menu.png)

#### Step 2: Copy the RDP Password

In the "Instructions for aa-scc-testvm1" pop-up window, click the clipboard icon next to the **Password** field. This copies the RDP session password to your clipboard, ready to paste in the next step.

![Instructions pop-up with copy password button](images/instructions-popup-copy-password.png)

#### Step 3: Handle the Security Warning

A "Remote Desktop Connection security warning" pop-up will appear automatically alongside the Instructions window when you click **Start Remote Desktop**. If it was closed or did not appear, you can launch it manually by downloading the RDP file and double-clicking it (see the [Troubleshooting](#troubleshooting) section for details).

**Optional:** Check the **Clipboard** checkbox before clicking **Connect**. This allows you to copy and paste content between your local machine and the VM, which is highly recommended.

![RDP security warning with Clipboard checkbox](images/rdp-security-warning-clipboard.png)

#### Step 4: Wait for the Connection

The Remote Desktop Connection progress window will appear:

![Remote Desktop Connection progress window](images/rdp-connecting-progress.png)

Once the connection is established, the following credential prompt will appear:

![Windows credential prompt](images/windows-credential-prompt.png)

#### Step 5: Paste the Password

Paste the password copied in Step 2 into the **Password** field, then click **OK**.

![Password pasted into credential prompt](images/paste-password-field-1.png)

![Password pasted into credential prompt, confirm](images/paste-password-field-2.png)

#### Step 6: Remote Desktop Opens

The Remote Desktop window will appear after a brief initialization:

![Remote Desktop window open](images/remote-desktop-window.png)

## Troubleshooting

Steps 1–6 above describe the normal flow. The following section covers common issues you may encounter.

### Issue: The RDP window did not appear or disappeared for some reason

**Solution:** In the Instructions dialog, click **Download RDP file** and save it to your computer. Double-click the downloaded file to launch the RDP connection manually, then continue from Step 3.

![Download RDP file solution](images/download-rdp-file-solution.png)

### Issue: Unable to connect — the Remote Desktop Connection progress window closes and displays an error

**Solution:** This is usually caused by an expired tunnel connection. First, try clicking **Reset Connection** in the Instructions dialog. If the problem persists, close the current session and restart the entire process from Step 1.

![Connection error window](images/connection-error-window.png)

Click **See details** to read more details:

![Connection error details expanded](images/connection-error-see-details.png)

First try to reset the connection (it will prompt you that it will interrupt the work done on the existing connection, just click **OK**):

![Reset connection confirmation prompt](images/reset-connection-confirm.png)
