#!/bin/bash 

###################################################################
#Script Name	:  Install and Config mariadb in Ubuntu 20.04                                                                               
#Description	:                                                                                 
#Args           :                                                                                           
#Author       	: Ulises Jimenez                                                
#Email         	: ulises.jimenez07@gmail.com                                           
###################################################################

#update and install required pacakted
sudo apt-get update
sudo apt install mariadb-server

#Confirm that mariadb is running with status ACTIVE
#exit ctrl+c
sudo systemctl status mariadb 

#Complete the installation of the RDBMS removing unsecure config
#Accept everything Y and create a new password for the root user
#Since it is the first time it will be set up, root does not have a password
#just press Enter and set new pass e.g. Example123
sudo mysql_secure_installation


#test connection with super user
sudo mysql -uroot -pexample123


#In the mariadb server, create a new user and grant access
CREATE USER 'big_data_user'@'%' IDENTIFIED BY 'Example123';
GRANT ALL PRIVILEGES ON *.* TO 'big_data_user';
FLUSH PRIVILEGES;


#additionally to allow ingress look for file /etc/mysql/my.cnf
#add the following lines at the bottom of the file
[mysqld]
skip-networking=0
skip-bind-address


# skip-networking is fairly simple. It just tells MariaDB to run without any of the TCP/IP networking options.
# bind-address requires a little bit of background information. A given server usually
# has at least two networking interfaces (although this is not required) and can easily have more.
# The two most common are a Loopback network device and a physical Network Interface Card (NIC) 
# which allows you to communicate with the network. MariaDB is bound to the loopback interface by 
# default because it makes it impossible to connect to the TCP port on the server from a remote host 
# (the bind-address must refer to a local IP address, or you will receive a fatal error and MariaDB will not start).
# This of course is not desirable if you want to use the TCP port from a remote host, so you must remove 
# this bind-address directive (MariaDB only supports one bind-address, but binds to 0.0.0.0, 
# or :: (every IP) if the bind-address directive is left out).

#Finally restart mariadb server
sudo systemctl restart mariadb 