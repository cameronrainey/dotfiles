#!/usr/bin/env bash

set -e

# Define the target directory (home directory)
TARGET="$HOME"
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check if stow is installed
if ! command -v stow >/dev/null 2>&1; then
    echo "Error: GNU stow is not installed."
    echo "Please install it first (e.g., 'sudo apt install stow' or 'brew install stow')."
    exit 1
fi

# Function to display usage
usage() {
    echo "Usage: $0 [package1 package2 ...]"
    echo "If no packages are specified, it will attempt to stow all directories."
    echo "Available packages: $(find "$DOTFILES_DIR" -maxdepth 1 -mindepth 1 -type d -not -name '.*' -exec basename {} \; | tr '\n' ' ')"
}

# If no arguments, list all directories that don't start with a dot
if [ $# -eq 0 ]; then
    PACKAGES=($(find "$DOTFILES_DIR" -maxdepth 1 -mindepth 1 -type d -not -name '.*' -exec basename {} \;))
else
    PACKAGES=("$@")
fi

cd "$DOTFILES_DIR"

for pkg in "${PACKAGES[@]}"; do
    echo "Stowing $pkg..."
    # --restow: unstow then stow again (useful for cleaning up old links)
    stow --restow --target="$TARGET" "$pkg"
done

echo "Dotfiles successfully stowed."
