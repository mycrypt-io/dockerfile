docker-cryptdb
============

OpenSSH + CryptDB + MySQL on Docker.

Includes a bunch of cool features such as:

 - OpenSSH, CryptDB, MySQL all in one
 - Setting a root password. //TODO

Here's how it works:

    $ docker run -d -P --name cdb mycrypt/cryptdb 
    cdb
    $ ssh root@192.168.59.103 -p49153 
    Enter password:

    $ service mysql start
    $ cryptdb.sh start

    then you can login in from Host:
    $ mysql -uroot -pletmein -h192.168.59.103 -P49155

(Example assumes MySQL client is installed on Docker host.)

Environment variables
---------------------

 
