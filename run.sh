docker run -ti --rm --name dev -v $HOME:/home/user -v /var/run/docker.sock:/var/run/docker.sock --privileged dev bash -c 'cd; tmux'
