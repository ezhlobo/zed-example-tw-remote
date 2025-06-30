FROM alpine:latest

RUN apk add --update nodejs npm

RUN apk add --no-cache openssh-server && \
    ssh-keygen -A && \
    echo "root:passwd" | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN mkdir -p /app

EXPOSE 22

RUN printf "#!/bin/sh \n\
    /usr/sbin/sshd -D & \n\
    pid=\"\$!\" \n\
    trap \"kill -SIGTERM \$pid\" SIGINT SIGTERM \n\
    wait \$pid \n\
    " >> /usr/local/bin/start-ssh.sh

RUN chmod +x /usr/local/bin/start-ssh.sh

CMD ["/usr/local/bin/start-ssh.sh"]
