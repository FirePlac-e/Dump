## Epitech Environment Setup Script

This repository contains a shell script (`INSTALL.sh`) designed to automate the installation of a development environment specifically tailored for **Epitech** students. It streamlines the setup of system tools, official school packages, and personal configurations.

---

### 🚀 What it installs

The script handles the installation and configuration of several key software categories:

#### 1. Productivity & Communication
* **VS Code**: Professional code editor installed via Snap.
* **Google Chrome**: Web browser installed via official `.deb` package.
* **Discord**: Communication platform installed via Snap.
* **Teams for Linux**: For school-related communication via Snap.

#### 2. Epitech Official Tools ("DUMP")
The script integrates the official Epitech PPA and sets up the following:
* **Clang-20**: The latest LLVM toolchain configured via `update-alternatives`.
* **Epitech C-Pool Tools**: Specific packages required for the C Pool curriculum.
* **Custom Editors**: Pre-configured versions of `epitech-emacs` and `epitech-vim`.
* **Emacs Config**: Automatically writes a custom `.emacs` file to your home directory featuring:
    * Epitech initialization.
    * Line and column numbering.
    * Improved mouse support (scrolling and clicking).
    * Windows-style copy/paste behavior (`CUA mode`).
    * Automatic parenthesis/bracket pairing.

#### 3. Development & Version Control
* **Git & SSH**: Interactive setup for your Epitech Git identity and automatic **Ed25519** SSH key generation.
* **Docker**: Installed via `docker.io` for containerized development.

---

### ⚠️ Prerequisites

* **Operating System**: Optimized for **Ubuntu 24.04 (Noble)** or compatible Debian-based systems.
* **Privileges**: **Do NOT run this script with `sudo`**. The script should be run as a standard user. It will request `sudo` permissions internally when installing system packages to ensure that configuration files in your home directory (like `.emacs` and SSH keys) are owned by your user, not root.

---

### 🛠️ How to use

1. **Clone the repository:**
   ```bash
   git clone https://github.com/FirePlac-e/Dump.git
   cd Dump
   ```

2. **Make the script executable:**
   ```bash
   chmod +x INSTALL.sh
   ```

3. **Run the installer:**
   ```bash
   ./INSTALL.sh
   ```

| Flag | Description |
| :--- | :--- |
| `--help`, `-h` | Displays the usage help menu. |

---

### 📝 Important Notes
> [!IMPORTANT]
> **SSH Key:** During the Git configuration, the script will print your **Public Key** to the terminal. Copy this key and add it to your [GitHub settings](https://github.com/settings/keys) and the Epitech Intranet to enable repository access.
>
> [!WARNING]
> The script uses `noninteractive` mode for mail server configuration during the Epitech tool installation. It automatically purges `postfix` at the end to keep your system clean and prevent local mail server conflicts.
