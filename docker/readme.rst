====
SFTP
====

About
=====

**SFTP**: SSH (Secure) File Transfer Protocol [1]_.

Version
-------
Based on the SSH service of **Alpine Linux** official image **version 3.x** available in Docker Hub [2]_.

License
-------
**LGPL-2.1, MIT, 2-clause BSD** [3]_.

Pre-requisites
==============

* *docker* installed
* access to DIGITbrain private docker repo (username, password) to pull the image:

  - ``docker login dbs-container-repo.emgora.eu``
  - ``docker pull dbs-container-repo.emgora.eu/sftp-alpine:3``

Usage
=====

``docker run -d --rm --name sftp -e SFTP_USER=myusername -e SFTP_PASSWORD=mypassword -p 1022:22 sftp-alpine:3``

where SFTP_USER and SFTP_PASSWORD are the username and password for SFTP connection.

The SFTP server will be accessible for this single user, with writable sub-directory: ``/home/myusername/``,
on port ``1022``.
It is possible to create multiple users with connecting to the container (``docker exec ... /bin/sh``) and
creating users manually.

The UID of the ``SFTP_USER`` will be 100, belonging to group ``sftp`` with GID ``101``.
These ids might be needed when mounting volumes (see below).

Security
========

SFTP provides secure transfers with password authentication and data transfer encryption (on top of SSH).
User connections are chrooted to directory ``/home``; only subdirectory ``/home/SFTP_USER`` is writable.
Interaction restricted to sftp (no SSH commands).

Always use and update SFTP_USER and SFTP_PASSWORD parameters prior to running the container.

Test:

.. code-block:: bash

  $ sftp -P 1022 myusername@xxx.xxx.xxx.xxx
  myusername@xxx.xxx.xxx.xxx's password:
  Connected to 193.225.250.14.
  sftp> cd myusername


Configuration
-------------

Parameters
----------

.. list-table::
   :header-rows: 1

   * - Name
     - Default value
     - Comment
   * - *Username*
     - ``-e SFTP_USER=myusername``
     - Username for SFTP connection
   * - *Password*
     - ``-e SFTP_PASSWORD=mypassword``
     - Password for SFTP connection

Ports
-----
.. list-table::
  :header-rows: 1

  * - Container port
    - Host port bind example
    - Comment
  * - SFTP
    - ``-p 1022:22``
    - Default SFTP (SSH) port 22 is opened as port 1022 on the host.

Volumes
-------

The container might use the following volume mounts.

.. list-table::
   :header-rows: 1

   * - Name
     - Volume mount
     - Comment
   * - *SFTP directory*
     - ``-v $PWD/sftp_directory_on_host:/home/$SFTP_USER``
     - SFTP data of user in container directory ``/home/$SFTP_USER`` will be persisted in host directory ``sftp_directory_on_host``.

References
==========

.. [1] https://en.wikipedia.org/wiki/SSH_File_Transfer_Protocol

.. [2] https://hub.docker.com/_/alpine

.. [3] https://www.wikidata.org/wiki/Q4033826

