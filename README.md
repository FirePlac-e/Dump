## Epitech Environment Setup Script

This repository contains a comprehensive shell script (`INSTALL.sh`) designed to automate the installation of a development environment, specifically tailored for **Epitech** students or developers looking for a ready-to-go Linux workstation.

---

### 🚀 What it installs

The script handles the installation and configuration of several key software categories:

#### 1. Productivity & Communication
* **VS Code**: Code editor.
* **Google Chrome**: Web browser.
* **Discord**: For communication.
* **Teams for Linux**: For school communication.

#### 2. Epitech Official Tools ("DUMP")
The script adds the official Epitech PPA and sets up the following:
* **Clang-20**: The latest LLVM toolchain for C/C++ development.
* **Epitech C-Pool Tools**: Specific packages required for the C Pool.
* **Custom Editors**: Pre-configured versions of `epitech-emacs` and `epitech-vim`.
* **Emacs Config**: Automatically writes a custom `.emacs` with mouse support, line numbering, and Epitech initialization.

#### 3. Development Essentials
* **Git**: For version control.
* **Docker**: For containerized development environments.

#### 4. Custom Desktop Environment
* **Hyprland**: Installs a great graphical interface.

---

### ⚠️ Prerequisites

* **Operating System**: Designed for **Ubuntu/Debian-based** systems (specifically mentions `noble` / 25.10 compatibility).
* **Privileges**: This script **must** be run as **root** (using `sudo`) because it manages system repositories and packages.

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

3. **Run with the desired options:**

| Flag | Description |
| :--- | :--- |
| `(No Flag)` | Runs the full installation (Editors, Tools, Git, and interactive Hyprland prompt). |
| `--hyprland`, `-hy` | Skips all Epitech tools and only installs the Hyprland environment. |
| `--help`, `-h` | Displays the usage help menu. |

**Example (Full Install):**
```bash
sudo ./INSTALL.sh
```

**Example (Only Hyprland):**
```bash
sudo ./INSTALL.sh --hyprland
```

---

### 📝 Important Notes
> [!WARNING]
> This script is non-interactive in many sections (using `DEBIAN_FRONTEND=noninteractive`). It will automatically purge `postfix` after the Epitech tool installation to keep your system clean.
