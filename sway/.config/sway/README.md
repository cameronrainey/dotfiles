# Sway Configuration

This directory contains the configuration files and scripts for my Sway environment, including custom scripts to manage displays and VPN connections.

## Requirements

The required packages for this setup are listed in `packages.txt`. 
They include core Sway tools, terminal (`foot`), application launcher (`fuzzel`), VPN (`protonvpn-cli`), and screenshot tools (`flameshot`).

## Installation

An automated installation script is provided to install the required dependencies (using `dnf` for Fedora) and set up the necessary symlinks using GNU Stow.

1. Make the installation script executable:
   ```bash
   chmod +x ~/.config/sway/install.sh
   ```

2. Run the installation script:
   ```bash
   ~/.config/sway/install.sh
   ```