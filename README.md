# Dotfiles

Cross-platform dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Dependencies

### Core
- `stow`
- `git`
- `pre-commit`

### Shell (Zsh)
- `zsh`
- `Oh My Zsh`

### Sway (Wayland)
If you plan to use the `sway` configuration, ensure you have the following dependencies installed. These are also listed in `sway/.config/sway/packages.txt`:

- `sway` (compositor)
- `swaybg` (background manager)
- `ptyxis` (terminal emulator)
- `fuzzel` (application launcher)
- `rofi-wayland` (application launcher / menu)
- `swaync` (Sway Notification Center)
- `libnotify` (notifications / `notify-send`)
- `flameshot` (screenshots)
- `jxl-pixbuf-loader` (for `.jxl` wallpaper support)
- `protonvpn-cli` (VPN integration)

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
