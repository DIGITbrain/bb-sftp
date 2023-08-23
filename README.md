## Deployment type

Docker

## Image

Based on Alpine linux official image on __Docker Hub__ [1].

## Licence

LGPL-2.1

## Version

3.x (Alpine)

## Description

SSH File Transfer Protocol (SFTP) server.
Base on description [2].

# Deployment


## Image build

Note: change password for test user in Dockerfile

```
cd docker
docker build -t sftp-image .
cd ..
```

## Docker run

Use container-internal disk (/sftdir), open port 2222 on host:

> docker run -d --restart=always --name sftp -p 2222:22 sftp-image


Use host volmue:

> docker run -d --restart=always --name sftp -p 2222:22 -v $PWD/somedir:/sftpdir sftp-image


# Test

> sftp -P 2222 digitbrain@localhost
>
> digitbrain@localhost's password:
>
> Connected to localhost.
>
> sftp>


# References

[1] https://hub.docker.com/_/alpine

[2] https://www.net7.be/blog/article/isolated_sftp_docker.html


