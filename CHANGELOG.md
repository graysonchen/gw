# Changelog

All notable changes to this project will be documented in this file.

## [0.1.2] - 2026-03-24

### Added
- `install.sh` — one-line install script, supports `curl | bash` quick installation.
- Updated README with one-line install command.

## [0.1.1] - 2026-03-24

### Added
- `gw.sh` — single entry point for shell integration. Only one line needed in `~/.zshrc`:
  ```bash
  source ~/.gw/gw.sh
  ```
  Replaces the previous 3-line setup (PATH, shell integration, completions).

### Fixed
- `gw cd <name>` now works correctly when shell integration is loaded — changes the current directory instead of only printing the path.

### Changed
- Simplified installation steps in README.

## [0.1.0] - 2026-03-24

### Added
- Initial release.
- Core commands: `init`, `add`, `rm`, `list`, `cd`, `link`, `config`, `prune`.
- Automatic symlink management via `.gw/links`.
- Shell integration for `gw cd`.
- Zsh completions.
