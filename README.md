# docker-devstation
Alpine based CLI - perfect for a dev/ops environment for macOS (bash, tmux, vim, git, ssh, elinks, docker client, openssl)

If you don't want to install a package managment on mac but still want to use your favorite commandline tools.

Main focus is on masOS Sierra (or later) but it might and should work on other systems as well.

# Usage

First I advice to create you __~/.tmux.conf__ how you like it.

For example:

```
echo "set-window-option -g mode-keys vi" >> ~/.tmux.conf
```

Then to use it, just add an alias to your __~/.bash_profile__ (I've jused tmuxc so inside the container tmux stays usable without a loop)

```
alias tmuxc='docker run -ti --rm -v $HOME:/home/user -v /var/run/docker.sock:/var/run/docker.sock --privileged marvambass/devstation bash -c "cd; tmux"'
```
