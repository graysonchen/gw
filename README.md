# gw — Git Worktree Manager

A lightweight CLI that wraps `git worktree` with automatic config/dependency linking for large projects.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/graysonchen/gw/main/install.sh | bash
```

Or manually:

```bash
git clone https://github.com/graysonchen/gw.git ~/.gw
echo 'source ~/.gw/gw.sh' >> ~/.zshrc
source ~/.zshrc
```

## Quick Start

```bash
cd ~/projects/myapp

# Initialize gw for this project
gw init

# Edit what files/dirs to symlink into worktrees
gw config edit

# Create a worktree (auto-links config & deps)
gw add feature/OA-12345

# List all worktrees
gw list

# Jump to a worktree (with fzf)
gw cd OA-12345

# Re-link config after changes
gw link OA-12345

# Remove a worktree
gw rm OA-12345

# Clean up stale worktree references
gw prune
```

## Project Config

Running `gw init` creates a `.gw/` directory in your project root:

```
myapp/
  .gw/
    config          # main repo path, worktree base path
    links           # files & dirs to symlink into worktrees
```

### `.gw/config`

```ini
worktree_base=../myapp-worktree
```

### `.gw/links`

```bash
# Config files (gitignored / local-only)
.bundle/config
config/database.yml
config/master.key

# Dependencies (shared to save disk)
vendor/bundle
node_modules

# Cache
tmp/cache
```

## Commands

| Command | Description |
|---------|-------------|
| `gw init` | Initialize `.gw/` config in current repo |
| `gw add <branch>` | Create worktree + auto-link |
| `gw rm <name>` | Remove a worktree |
| `gw list` | List all worktrees |
| `gw cd <name>` | cd into a worktree (or fzf pick) |
| `gw link [name]` | Re-run symlink for a worktree |
| `gw config show` | Show current config |
| `gw config edit` | Open config in $EDITOR |
| `gw prune` | Clean stale worktree refs |
| `gw help` | Show help |

## Requirements

- Git 2.5+
- Bash 4+
- Optional: `fzf` for interactive selection

## License

MIT
