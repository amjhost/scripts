# Setup Script for Ubuntu 22.04

This script automates the setup of several tools and services on an Ubuntu 22.04 system. It performs system updates, installs Docker, Python, Docker Compose, and sets up several applications including Yacht, Portainer, code-server, and CloudPanel.

**Important**: This script needs to be run with root privileges.

## Prerequisites

- **Operating System**: Ubuntu 22.04
- **Privileges**: Must be run as root (use `sudo`).

## What This Script Does

1. **Update and Upgrade Packages**: Updates the package list and upgrades installed packages to their latest versions.
2. **Install Docker and Python**: Installs Docker, Python, and Docker Compose.
3. **Install Yacht**: Deploys Yacht using Docker for managing Docker containers.
4. **Install Portainer**: Deploys Portainer using Docker for managing Docker environments.
5. **Install Code-Server**: Installs and configures code-server for remote development.
6. **Install CloudPanel**: Installs CloudPanel for managing cloud infrastructure.

## Usage

1. **Save the Script**: Copy the script into a file, e.g., `setup.sh`.
2. **Make the Script Executable**: Run `chmod +x setup.sh` to make the script executable.
3. **Run the Script**: Execute the script with root privileges using `sudo ./setup.sh`.

```bash
sudo ./setup.sh
