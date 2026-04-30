## Epitech & Hyprland Environment Setup Script

This repository contains a comprehensive shell script (`INSTALL.sh`) designed to automate the installation of a development environment, specifically tailored for **Epitech** students or developers looking for a ready-to-go Linux workstation.

---

### 🚀 What it installs

The script handles the installation and configuration of several key software categories:

#### 1. Productivity & Communication
* **VS Code**: Professional code editor installed via Snap.
* **Google Chrome**: Web browser installed via official `.deb` package.
* **Discord**: Communication platform installed via Snap.
* **Teams for Linux**: For school-related communication.

#### 2. Epitech Official Tools ("DUMP")
The script integrates the official Epitech PPA and sets up the following:
* **Clang-20**: The latest LLVM toolchain configured via `update-alternatives`.
* **Epitech C-Pool Tools**: Specific packages required for the C Pool curriculum.
* **Custom Editors**: Pre-configured versions of `epitech-emacs` and `epitech-vim`.
* **Emacs Config**: Automatically writes a custom `.emacs` file to your home directory with mouse support, line numbering, and Epitech initialization.

#### 3. Development & Version Control
* **Git & SSH**: Interactive setup for your Epitech Git identity and automatic Ed25519 SSH key generation.
* **Docker**: Installed via `docker.io` for containerized development.

#### 4. Custom Desktop Environment
* **Hyprland**: An interactive prompt allows you to install the Hyprland tiling window manager (via the JaKooLit Ubuntu-Hyprland v25.10 installer).

---

### ⚠️ Prerequisites

* **Operating System**: Designed for **Ubuntu 24.04 (Noble)** or compatible Debian-based systems.
* **Privileges**: **Do NOT run this script with `sudo`**. The script is designed to run as a standard user to ensure your home directory files (SSH keys, Emacs config, Hyprland) are owned by you. It will prompt for your password internally when administrative tasks are performed.

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

3. **Run as a standard user:**

| Flag | Description |
| :--- | :--- |
| `(No Flag)` | Runs the full installation (Tools, Git config, and interactive Hyprland prompt). |
| `--hyprland` | Skips all Epitech tools and only installs the Hyprland environment. |
| `--help`, `-h` | Displays the usage help menu. |

**Example (Full Install):**
```bash
./INSTALL.sh
```

**Example (Only Hyprland):**
```bash
./INSTALL.sh --hyprland
```

---

### 📝 Important Notes
> [!IMPORTANT]
> **SSH Key:** After the Git configuration section, the script will display your new Public Key. You should copy this and add it to your [GitHub settings](https://github.com/settings/keys) or Epitech Intranet.
>
> [!WARNING]
> This script uses `noninteractive` mode for package installation. It will automatically purge `postfix` after the Epitech tool installation to prevent mail server conflicts.
