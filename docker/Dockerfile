FROM alpine:3.14.2

EXPOSE 22

RUN apk add --no-cache openssh
COPY ./sshd_config /etc/ssh/
COPY ./start.sh /usr/bin/
RUN chmod +x /usr/bin/start.sh

# sftp directory visible for users
RUN mkdir /sftpdir

# Add 'digitbrain' user with password 'CHANGEIT!'
RUN addgroup -S digitbrain && adduser -S digitbrain -G digitbrain -s /bin/ash -h /sftpdir -H
RUN echo "digitbrain:CHANGEIT!" | chpasswd

# Default is to run the OpenSSH server
CMD ["/usr/bin/start.sh"]
