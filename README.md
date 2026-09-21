# Epitech Environment Setup Script

This repository contains a shell script (`INSTALL.sh`) designed to automate the installation of a development environment specifically tailored for **Epitech** students. It streamlines the setup of system tools, official school packages, and personal configurations.

---

### 🚀 What it installs

The script handles the installation and configuration of several key software categories:

#### 1. Shell & Productivity
* **Zsh & Oh My Zsh**: Installs `zsh`, sets up Oh My Zsh, and changes the default shell to `zsh`.
* **VS Code**: Professional code editor installed via Snap.
* **Google Chrome**: Web browser installed via official `.deb` package.
* **Discord**: Communication platform installed via Snap.

#### 2. Development & Epitech Tools
* **Epitech DUMP**: Runs the official Epitech setup script from GitHub.
* **Clang Toolchain**: Sets `clang` and `clang++` alternatives to version 21 (`clang-21` / `clang++-21`)[cite: 1].
* **TEK1 Workspace**: Automatically creates a `TEK1` directory in the current working directory[cite: 1].
* **Development Utilities**:
  * `micro` (terminal text editor)[cite: 1]
  * `tcsh` (C shell)[cite: 1]
  * `valgrind` (memory debugging tool)[cite: 1]
  * `libcsfml-dev` (CSFML development libraries)[cite: 1]
  * `npm` (Node Package Manager)[cite: 1]
  * `curl` (data transfer utility)[cite: 1]

#### 3. Version Control & SSH
* **Git & SSH Key**: Prompts for your Epitech email and name, generates an **Ed25519** SSH key, starts the `ssh-agent`, adds the key, displays the public key, and configures global Git user settings (`user.email` and `user.name`)[cite: 1].

---

### 🛠️ Options

You can view the usage help by passing the `-h` or `--help` option[cite: 1]:

```bash
./INSTALL.sh --help
