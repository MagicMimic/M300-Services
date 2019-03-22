####################################################
#                                                  #
#	Datenbank installieren und Konfigurieren   #
#             von Michel Gröbli                    #
#                                                  #
####################################################

apt update -y

#Passwort für den Root setzen
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password Test123'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password Test123'

# Installation von MySQL
sudo apt-get install -y mysql-server

# MySQL Port öffnen
sudo sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

# Einen User für den Remote Zugriff setzen
mysql -uroot -pTest123 <<%EOF%
	CREATE USER 'root'@'192.168.55.100' IDENTIFIED BY 'admin';
	GRANT ALL PRIVILEGES ON *.* TO 'root'@'192.168.55.100';
	FLUSH PRIVILEGES;
%EOF%

# Eine Datenbank mit Beispieldaten anlegen
mysql -uroot -pTest123 <<%EOF%
	create database if not exists sensoren;
	create user 'www-data'@'localhost' identified by 'mbed'; 
	grant usage on *.* to 'www-data'@'192.168.55.100' identified by 'mbed';
	grant all privileges on sensoren.* to 'www-data'@'192.168.55.100';
	flush privileges;
	use sensoren;
	create table data ( seq INT PRIMARY KEY AUTO_INCREMENT, b FLOAT, c FLOAT, created TIMESTAMP DEFAULT CURRENT_TIMESTAMP );
	insert into data(b, c) values ( 0.1, 0.2);
	insert into data(b, c) values ( 0.5, 0.6);
%EOF%


# MySQL Service neustarten um die Config zu speichern
sudo service mysql restart

# Unkomplizierte Firewall installieren
sudo apt-get install ufw
sudo ufw enable

# Port 80 und 22 und 3306 freigeben
sudo ufw enable
sudo ufw allow from 192.168.0.100 to any port 22
sudo ufw allow from 192.168.55.101 to any port 3306

# SSH Key generieren
#sudo ssh-keygen -t rsa -b 4096 
#ssh-copy-id -i ~/.ssh/id_rsa.pub root@db
