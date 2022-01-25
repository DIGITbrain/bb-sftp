#!/bin/sh

# generate SSH host keys if not yet
INIT_FILE=/initialized
if [ ! -f "$INIT_FILE" ]; then
  echo "Generating SSH host keys..."
  ssh-keygen -A
  echo "1" > $INIT_FILE
fi

# if no user given, set digitbrain/digitbrain
if [[ -z "${SFTP_USER}" ]]; then SFTP_USER="digitbrain"; fi
if [[ -z "${SFTP_PASSWORD}" ]]; then SFTP_PASSWORD="digitbrain"; fi

# create sftp group
addgroup -S sftp

# create home dir, user, password
mkdir /home/${SFTP_USER}
adduser -S ${SFTP_USER} -G sftp -s /bin/ash -h /home/${SFTP_USER} -H
echo "${SFTP_USER}:${SFTP_PASSWORD}" | chpasswd
chown ${SFTP_USER}:sftp /home/${SFTP_USER}

# start OpenSSH server
/usr/sbin/sshd -D -e

