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
