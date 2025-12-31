# Dotfiles

## Installation

From `~` run:
```
git clone git@github.com:saivenky/dotfiles.git .dotfiles
```

Use with GNU `stow`. If not installed on your system:
```
# Ubuntu/Debian
sudo apt-get install stow

# Homebrew
brew install stow
```

## Usage (and Explanation)

Run `stow .` from the root of the `dotfiles` repo folder.

### Explanation

`stow` is a "symlink farm manager". In other words, it will walk through one
directory and then create symlinks for all of those files in another directory.

* By default, `stow` uses the current directory as the value for `--dir`.
* It looks for the file or folder specified relative to `--dir`.
* By default, `--target` is the parent of `--dir`.

So if you're in the `dotfiles` repo folder. Running `stow xyz` is the equivalent of:

```
stow xyz --dir=. --target=..
```

But you could also run the very explicit version (assuming your dotfiles repo is at `~/.dotfiles`:

```
stow xyz --dir=~/.dotfiles --target=~
```

## Machine-Specific Configuration

This dotfiles setup supports machine-specific configurations that override or extend the base configuration. All machine-specific settings are stored in `.local` files that are **never committed** to the repository.

### How It Works

The base configuration files (`.bashrc`, `.zshrc`, `.gitconfig`) automatically load their `.local` counterparts if they exist:

- **`.bashrc`** sources `.bashrc.local` (bash-specific overrides)
- **`.zshrc`** sources `.zshrc.local` (zsh-specific overrides)
- **`.gitconfig`** includes `.gitconfig.local` (git identity and machine-specific git settings)
- Both shells source **`.shellrc/local.sh`** (common settings shared between bash and zsh)

Local settings are loaded **after** base settings, so they can override any configuration.

### Local Files (Create as Needed)

| File | Purpose | Example Use Cases |
|------|---------|-------------------|
| `~/.gitconfig.local` | Git identity and machine-specific git config | User name, email, signing keys |
| `~/.shellrc/local.sh` | Common shell settings for both bash and zsh | Environment variables, feature flag overrides, shared aliases |
| `~/.bashrc.local` | Bash-specific overrides | Bash-only aliases, bash-specific settings |
| `~/.zshrc.local` | Zsh-specific overrides | Zsh-only aliases, zsh-specific settings |

### Usage Examples

#### Git Identity (Required)

Create `~/.gitconfig.local` with your git identity:

```ini
[user]
    name = Your Name
    email = your.email@example.com
```

#### Override Feature Flags

Create `~/.shellrc/local.sh` to enable/disable different modules on different machines:

```bash
# Work laptop - enable Java and Android development
export DOTFILES_JAVA_ENABLED=1
export DOTFILES_ANDROID_ENABLED=1

# Personal laptop - disable work-specific modules
export DOTFILES_RUBY_ENABLED=0
```

#### Machine-Specific Environment Variables

Add to `~/.shellrc/local.sh`:

```bash
# Work-specific API keys and tokens
export WORK_API_KEY="secret-key-here"
export JIRA_TOKEN="token-here"

# Custom PATH additions
export PATH="$HOME/work-bin:$PATH"
```

#### Custom Aliases for Specific Machines

Add to `~/.zshrc.local` or `~/.bashrc.local`:

```bash
# Work VPN shortcuts
alias vpnup='sudo openconnect work.vpn.com'
alias vpndown='sudo killall openconnect'

# Machine-specific shortcuts
alias deploy='ssh production-server'
```

### Important Notes

- All `.local` files are gitignored and will **never be committed**
- Create `.local` files only on machines where you need custom configuration
- If a `.local` file doesn't exist, it's silently skipped (no errors)
- Local settings **override** base settings (loaded last)
