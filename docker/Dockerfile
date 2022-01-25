# docker build -t sftp:3.14.2 .
# docker run -d --rm --name sftp -e SFTP_USER=db -e SFTP_PASSWORD=db -p 10000:22 -v $PWD/dir:/home/db sftp:3.15

# Alpine base image
FROM alpine:3.15

# SFTP port
EXPOSE 22

# copy necessary files
RUN apk add --no-cache openssh
COPY ./sshd_config /etc/ssh/
COPY ./start.sh /usr/bin/
RUN chmod +x /usr/bin/start.sh

# start wrapper on container start
CMD ["/usr/bin/start.sh"]

