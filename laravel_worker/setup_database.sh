echo 'nameserver 192.173.1.2' > /etc/resolv.conf
apt-get update
apt-get install mariadb-server -y
service mysql start

CREATE USER 'kelompoka09'@'%' IDENTIFIED BY 'passworda09';
CREATE USER 'kelompoka09'@'localhost' IDENTIFIED BY 'passworda09';
CREATE DATABASE dbkelompoka09;
GRANT ALL PRIVILEGES ON *.* TO 'kelompoka09'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'kelompoka09'@'localhost';
FLUSH PRIVILEGES;

# Db akan diakses oleh 3 worker, maka 
echo '# This group is read both by the client and the server
# use it for options that affect everything
[client-server]

# Import all .cnf files from configuration directory
!includedir /etc/mysql/conf.d/
!includedir /etc/mysql/mariadb.conf.d/

# Options affecting the MySQL server (mysqld)
[mysqld]
skip-networking=0
skip-bind-address
' > /etc/mysql/my.cnf