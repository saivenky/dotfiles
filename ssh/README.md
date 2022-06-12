# SSH

You should not include any files here and this is here as as warning not to.
Your SSH agent should start automatically and use `~/.ssh/config` as the
settings file.

In here, include SSH keys that you want to include with the following format:

```
# Global keys used on all hosts
IdentityFile ~/.ssh/<private key, i.e. not ending in .pub>

# Host-Specific
Host github.com
    IdentityFile ~/.ssh/<private key for github>
```
