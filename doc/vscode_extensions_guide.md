# Installing VS Code Extensions in tiCrypt (Offline)

How to get VS Code extensions working inside a tiCrypt virtual machine.

---

## Why you need this

tiCrypt virtual machines have no internet access, so the **Extensions** panel inside the VM cannot search for or install anything — it has no route to the Marketplace.

The workaround has three parts:

1. On **your local computer with an internet connection**, download each extension as a `.vsix` file.
2. **Transfer** the `.vsix` files to the target VM.
3. **Install** the extensions using the VS Code installed in the VM.

A `.vsix` file is just a packaged extension — the same thing VS Code downloads for you when you click **Install** normally. VS Code can save one to disk for you, which is the method this document uses.

---

## Table of Contents

- [Before you start](#before-you-start)
- [Step 1: Download the extension as a .vsix file](#step-1-download-the-extension-as-a-vsix-file)
- [Step 2: Transfer the files into tiCrypt](#step-2-transfer-the-files-into-ticrypt)
- [Step 3: Install the extensions in the VM](#step-3-install-the-extensions-in-the-vm)
- [Step 4: Confirm they actually work](#step-4-confirm-they-actually-work)
- [FAQs](#faqs)

---

## Before you start

You will need:

- **VS Code on your local computer, with an internet connection.** You will use it to download the `.vsix` files for the extensions you want. This computer can be Windows, macOS, or Linux — it does not need to match the VM.
- **VS Code already installed on your tiCrypt VM.**
- **The operating system of your VM.** A standard tiCrypt VM is 64-bit Linux. To confirm, open a terminal inside the VM and run `uname -s -m` — `Linux x86_64` is the standard case.

You do **not** need the extensions installed on your local computer. Searching for them is enough.

---

## Step 1: Download the extension as a .vsix file

Do this on **your local computer with an internet connection** — not inside tiCrypt, which has no route to the Marketplace.

VS Code can download an extension as a file instead of installing it. This is a built-in feature intended for exactly this situation.

1. Open the Extensions view:
   - **Windows / Linux:** `Ctrl+Shift+X`
   - **macOS:** `Cmd+Shift+X`
   - Or from the menu: **View > Extensions**
2. **Search for the extension** in the search box. You do not need to install it.
3. **Right-click** the extension in the results list.
4. Choose **Download VSIX**.
5. **If a list of platforms appears**, choose **Linux 64 bit** — the platform of the tiCrypt VM, not of the computer you are sitting at. Many extensions have a single universal build and will not ask.
6. Choose the folder to save into.

> **Get the platform right.** Choosing your own laptop's platform produces a file that installs without complaint and then silently fails to work.

Repeat for each extension you want. Some extensions require others to be downloaded alongside them — see [Does my extension need other extensions?](#does-my-extension-need-other-extensions-with-it) below.

---

## Step 2: Transfer the files into tiCrypt

Transfer the `.vsix` files to the target VM, the same way you move any research file into tiCrypt.

---

## Step 3: Install the extensions in the VM

Inside the tiCrypt VM, either route works.

### Using the VS Code interface

1. Open the Extensions view (`Ctrl+Shift+X`)
2. Click the **`...`** menu at the top of the Extensions panel
3. Choose **Install from VSIX...**
4. Select your `.vsix` file

Or from the Command Palette (`Ctrl+Shift+P`), run **Extensions: Install from VSIX**.

### Using the terminal

First change into whichever folder your `.vsix` files ended up in, then install by filename:

```bash
cd /path/to/your/vsix/files
code --install-extension ./ms-python.python-2026.4.0-linux-x64.vsix
```

A successful install ends with `Extension '...' was successfully installed.` You may also see a `DeprecationWarning` about `url.parse()` — that is harmless noise from VS Code itself, not a problem with your extension.

You can repeat the flag to install several at once:

```bash
code --install-extension ./one.vsix --install-extension ./two.vsix
```

Or install every `.vsix` file in the folder:

```bash
for f in *.vsix; do code --install-extension "$f"; done
```

**If you see complaints about missing dependencies,** run the loop a second time. Some extensions need another one installed first — Python before Pylance, for instance — and a second pass resolves the ordering.

**Reload VS Code** when you are finished so the extensions activate.

---

## Step 4: Confirm they actually work

Two checks, and the second matters more than the first.

**Check that they registered.** In the VM's terminal:

```bash
code --list-extensions --show-versions
```

Each line comes back as `publisher.name@version`. Anything you installed that is missing from this list failed.

**Check that they function.** This is the important one, because an extension built for the wrong platform will appear in that list and still do nothing. Open a real file of the relevant type — a `.py` file for Python, for instance — and confirm the features appear: syntax highlighting, autocomplete, the interpreter selector in the status bar.

If a language feature is missing, open the **Output** panel (**View > Output**) and select that extension's channel from the dropdown. Errors about missing binaries, wrong architecture, or a failed language server mean you have the wrong platform build — go back to [Step 1](#step-1-download-the-extension-as-a-vsix-file) and download again, choosing **Linux 64 bit**.

---

## FAQs

- [Does my extension need other extensions with it?](#does-my-extension-need-other-extensions-with-it)
- [Will I be warned if I forget a companion extension?](#will-i-be-warned-if-i-forget-a-companion-extension)
- [How do I check a downloaded .vsix for companion extensions?](#how-do-i-check-a-downloaded-vsix-for-companion-extensions)
- [Which extensions may not be compatible in a secure enclave environment?](#which-extensions-may-not-be-compatible-in-a-secure-enclave-environment)
- [Can I tell in advance whether an extension needs the network?](#can-i-tell-in-advance-whether-an-extension-needs-the-network)
- [When would I use Download Specific Version VSIX or Download Pre-Release VSIX?](#when-would-i-use-download-specific-version-vsix-or-download-pre-release-vsix)
- [Can I copy my settings and keyboard shortcuts across too?](#can-i-copy-my-settings-and-keyboard-shortcuts-across-too)
- [Will these extensions update themselves?](#will-these-extensions-update-themselves)
- [Can I just copy my whole extensions folder across instead?](#can-i-just-copy-my-whole-extensions-folder-across-instead)

### Does my extension need other extensions with it?

Possibly. Many extensions rely on others. Normally VS Code fetches those for you; offline it cannot, so you have to download them yourself.

To find out, open the extension's detail page in VS Code and look at the tabs across the top — **DETAILS**, **FEATURES**, **CHANGELOG**, and then either or both of:

- **EXTENSION PACK** — a set of extensions this one installs alongside itself
- **DEPENDENCIES** — extensions this one requires

**Neither tab is always present.** If an extension declares no pack and no dependencies, you will see only Details, Features, and Changelog — which means there is nothing extra to download. The tabs appear only when there is something to list.

Download everything listed on whichever of those tabs you see, using the same steps as the extension itself.

**Python is the common example.** Its **EXTENSION PACK** tab lists three extensions:

| Extension | Platform prompt? | Without it |
| --- | --- | --- |
| `ms-python.vscode-pylance` | No — universal | No autocomplete or type checking |
| `ms-python.debugpy` | Yes — choose **Linux 64 bit** | Cannot debug |
| `ms-python.vscode-python-envs` | No — universal | No environment management view |

As the table shows, pack members can themselves be platform-specific, so watch for the platform prompt on each one.

### Will I be warned if I forget a companion extension?

No. Installing the Python extension without its pack members looks exactly like a clean install:

```
$ code --install-extension ./ms-python.python-2026.4.0-linux-x64.vsix
Installing extensions...
Extension 'ms-python.python-2026.4.0-linux-x64.vsix' was successfully installed.
```

No warning, no mention of the three pack members that did not come with it. VS Code does record the failure to fetch them, but in its own log files rather than in the terminal, so in practice you will not see it.

### How do I check a downloaded .vsix for companion extensions?

A `.vsix` is a ZIP archive. Open it and read `extension/package.json` — its `extensionPack` and `extensionDependencies` arrays list the companions, and are exactly what the **EXTENSION PACK** and **DEPENDENCIES** tabs display.

### Which extensions may not be compatible in a secure enclave environment?

Some extensions need a network service to do anything at all, so they cannot function inside tiCrypt:

- **Remote - SSH, Remote - Containers, Remote - WSL, Remote - Tunnels**
- **GitHub Copilot and Copilot Chat**
- Anything that calls an external API (translation, cloud storage, AI assistants)

Carry across the language support, formatters, linters, themes, and notebook tooling.

### Can I tell in advance whether an extension needs the network?

Not reliably. There is no flag for this — an extension's manifest has no field declaring that it needs the internet, so VS Code has nothing to show you and no filter to offer. What you have instead are three practical signals:

1. **Does it require signing in to an account?** If yes, it needs the network. This covers Copilot, and any extension tied to a cloud service.
2. **What does the extension's own description say?** Read the overview and any **Requirements** section on the detail page. Extensions that talk to a server usually say so, because they need you to configure an endpoint or a key.
3. **What is it for?** An extension that formats, highlights, or lints your files works on local text and will be fine. An extension whose purpose is to reach something else — a remote machine, a cloud API, a model — will not.

If you are unsure, install it and find out. Nothing breaks: an extension that cannot reach the network simply fails to do its job. To see why, open the **Output** panel (**View > Output**) and pick that extension's channel from the dropdown — failed or timed-out requests appear there.

### When would I use Download Specific Version VSIX or Download Pre-Release VSIX?

Alongside **Download VSIX**, right-clicking an extension in the Extensions view offers two other download options:

- **Download Specific Version VSIX...** — lets you pick from the extension's version history. Use it if an install is refused because the VM's VS Code is older than the extension requires. Run `code --version` in the VM to see which version you have.
- **Download Pre-Release VSIX** — the pre-release channel, where the extension offers one. Not normally what you want.

### Can I copy my settings and keyboard shortcuts across too?

**Not recommended.** Set your preferences up fresh inside tiCrypt instead. VS Code itself treats both as machine-specific:

- **Settings.** VS Code classifies a whole category of settings as machine-scoped (`machine` and `machine-overridable`), and Settings Sync **deliberately never transfers them**, because their values only make sense on one computer. These are the settings that point at a Python interpreter, a compiler, a JDK, a `git` executable, or a Windows or macOS shell profile. Copied into the VM they point at things that do not exist, and the resulting failures are hard to diagnose — a language server that will not start looks identical to a badly installed extension.
- **Keyboard shortcuts.** Settings Sync synchronizes these **per platform by default**, for the same reason. Bindings written on a Mac use `cmd` and simply do not fire on a Linux VM.

### Will these extensions update themselves?

No. VS Code disables automatic updates for extensions installed from a `.vsix` by default. That is sensible offline, but it means updating an extension requires repeating this process with a newer version.

### Can I just copy my whole extensions folder across instead?

**Not recommended.** You may be tempted to copy `~/.vscode/extensions` from your computer straight into the VM. It sometimes works, but any extension containing compiled programs — Python, Python Debugger, Jupyter, C/C++ — will break if your computer and the VM run different operating systems, and it breaks silently. Use the `.vsix` method described in this document instead.

---

## References

- [VS Code: Can I download an extension directly from the Marketplace?](https://code.visualstudio.com/docs/configure/extensions/extension-marketplace#_can-i-download-an-extension-directly-from-the-marketplace)
- [VS Code: Install from a VSIX](https://code.visualstudio.com/docs/configure/extensions/extension-marketplace#_install-from-a-vsix)
- [VS Code: Platform-specific extensions](https://code.visualstudio.com/api/working-with-extensions/publishing-extension#platform-specific-extensions)
- [VS Code: Extension manifest reference](https://code.visualstudio.com/api/references/extension-manifest)
- [VS Code: Settings Sync — configuring synced data](https://code.visualstudio.com/docs/configure/settings-sync#_configuring-synced-data)
- [tiCrypt: Transfer files from the Vault into a virtual machine](https://ticrypt.com/docs/user-guide/virtual-machines/vm-file-operations#transfer-files-from-the-vault-into-a-virtual-machine)

---

**Last Updated:** 2026-09-14
**Maintained by:** BU Research Computing Services
