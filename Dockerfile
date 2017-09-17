FROM golang:alpine

RUN apk --no-cache add bash \
                       tmux \
                       vim \
                       sudo \
                       openssl \
                       openssh-client \
                       git \
                       elinks \
                       docker \
                       ansible \
                       wget \
                       curl \
                       gnutls \
                       gnutls-utils \
                       pwgen \
 \
 && curl -L https://github.com/docker/compose/releases/download/1.15.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose \
 && chmod a+x /usr/local/bin/docker-compose \
 \
 && echo 'export PS1='"'"'devstation:\W \u\$ '"'" >> /etc/profile \
 \
 && adduser -D -s /bin/bash user \
 \
 && sed -i 's/^docker.*/docker:x:50:user/g' /etc/group \
 \
 && echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER user 
