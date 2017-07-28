FROM alpine

RUN apk --no-cache add bash \
                       tmux \
                       vim \
                       sudo \
                       openssl \
                       openssh-client \
                       git \
                       elinks \
                       docker \
                       wget \
                       curl \
 \
 && echo "set-window-option -g mode-keys vi" >> /root/.tmux.conf \
 \
 && adduser -D -s /bin/bash user \
 \
 && echo 'export PS1="'"\$(whoami)@devstation:\$(pwd) > "'"' >> /etc/bashrc \
 && echo 'export PS1="'"\$(whoami)@devstation:\$(pwd) > "'"' >> /etc/profile \
 \
 && sed -i 's/^docker.*/&user/g' /etc/group \
 && sed -i 's/^docker.*/docker:x:50:user/g' /etc/group \
 \
 && echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
 \
 && curl -L https://github.com/docker/compose/releases/download/1.14.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose \
 && chmod a+x /usr/local/bin/docker-compose

USER user 
