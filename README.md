# Dotfiles

Cross-platform dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Requirements

- `stow`
- `git`
- `pre-commit`
- `zsh`
- `Oh My Zsh`

## Installation

1. Clone the repository:
   ```bash
   git clone <repo-url> ~/dotfiles
   cd ~/dotfiles
   ```

2. Set up `pre-commit` hooks (to prevent committing secrets):
   ```bash
   pre-commit install
   ```

3. Stow the desired packages:
   ```bash
    stow sway
   ```

   Alternatively, use the provided install script:
   ```bash
   ./install.sh bash zsh vim sway
   ```

## Using Stow

GNU Stow creates symlinks from the dotfiles directory to your home directory.

- The directory name (e.g., `bash`, `vim`) is the "package".
- The contents of that directory are symlinked to the parent directory of where `stow` is run (typically your home directory if you run `stow` inside `~/dotfiles` with default settings, or you can explicitly set the target).
- To unstow (remove symlinks): `stow -D <package>`

## Sway Requirements

If you plan to use the `sway` configuration, ensure you have the required dependencies installed. You can find the list of packages in `sway/.config/sway/packages.txt`.

Common dependencies for this setup include:
- `sway` and `swaybg` (compositor and background manager)
- `foot` (terminal emulator)
- `rofi-wayland` or `fuzzel` (application launchers)
- `libnotify` (notifications)
- `flameshot` (screenshots)
- `protonvpn-cli` (VPN)

You can view the full list or use the provided scripts in `sway/.config/sway/` if applicable.
