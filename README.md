# Jarkom-Modul-3-A09-2023
**Praktikum Jaringan Komputer Modul 3 Tahun 2023**

## Author
| Nama | NRP |Github |
|---------------------------|------------|--------|
|Andika Laksana Putra | 5025211001 | https://github.com/DikaPutra07 |
|M. Naufal Badruttamam | 5025211240 | https://github.com/Caknoooo |

# Laporan Resmi
## Daftar Isi
- [Laporan Resmi](#laporan-resmi)
  - [Daftar Isi](#daftar-isi)
  - [Topologi](#topologi)
  - [Config](#config)
  - [Sebelum Memulai](#sebelum-memulai)
- [Soal 1](#Soal-1)
  - [Script](#script)
  - [Result](#result)
- [Soal 2](#Soal-2)
  - [Script](#script-1)
- [Soal 3](#Soal-3)
  - [Script](#script-2)
- [Soal 4](#Soal-4)
  - [Script](#script-3)
  - [Result](#result-1)
- [Soal 5](#Soal-5)
  - [Script](#script-4)
  - [Result](#result-2)
- [Soal 6](#Soal-6)
  - [Script](#script-5)
  - [Result](#result-3)
- [Soal 7](#Soal-7)
  - [Script](#script-6)
  - [Result](#result-4)
- [Soal 8](#Soal-8)
  - [Script](#script-7)
  - [Result](#result-5)
- [Soal 9](#Soal-9)
  - [Script](#script-8)
  - [Result](#result-6)
- [Soal 10](#Soal-10)
  - [Script](#script-9)
  - [Result](#result-7)
- [Soal 11](#Soal-11)
  - [Script](#script-10)
  - [Result](#result-8)
- [Soal 12](#Soal-12)
  - [Script](#script-11)
  - [Result](#result-9)
- [Soal 13](#Soal-13)
  - [Script](#script-12)
  - [Result](#result-10)
- [Soal 14](#Soal-14)
  - [Script](#script-13)
  - [Result](#result-11)
- [Soal 15](#Soal-15)
  - [Script](#script-14)
  - [Result](#result-12)
- [Soal 16](#Soal-16)
  - [Script](#script-15)
  - [Result](#result-13)
- [Soal 17](#Soal-17)
  - [Script](#script-16)
  - [Result](#result-14)
- [Soal 18](#Soal-18)
  - [Script](#script-17)
  - [Result](#result-15)
- [Soal 19](#Soal-19)
  - [Script](#script-18)
  - [Result](#result-16)
- [Soal 20](#Soal-20)
  - [Script](#script-19)
  - [Result](#result-17)

## Topologi
![image](https://github.com/Caknoooo/Jarkom-Modul-3-A09-2023/assets/92671053/b7ae49b5-70ff-4520-b0b0-d4f740f09198)

## Config
- **Aura (DHCP Relay)**
```
auto eth0
iface eth0 inet dhcp
up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.173.0.0/16

auto eth1
iface eth1 inet static
	address 192.173.1.0
	netmask 255.255.255.0

auto eth2
iface eth2 inet static
	address 192.173.2.0
	netmask 255.255.255.0

auto eth3
iface eth3 inet static
	address 192.173.3.0
	netmask 255.255.255.0

auto eth4
iface eth4 inet static
	address 192.173.4.0
	netmask 255.255.255.0

```
- **Himmel (DHCP Server)**
```
auto eth0
iface eth0 inet static
	address 192.173.1.1
	netmask 255.255.255.0
	gateway 192.173.1.0

```
- **Heiter (DNS Server)**
```
auto eth0
iface eth0 inet static
	address 192.173.1.2
	netmask 255.255.255.0
	gateway 192.173.1.0
```
- **Denken (Database Server)**
```
auto eth0
iface eth0 inet static
	address 192.173.2.1
	netmask 255.255.255.0
	gateway 192.173.2.0
```
- **Eisen (Load Balancer)**
```
auto eth0
iface eth0 inet static
	address 192.173.2.2
	netmask 255.255.255.0
	gateway 192.173.2.0
```
- **Frieren (Laravel Worker)**
```
auto eth0
iface eth0 inet static
	address 192.173.4.3
	netmask 255.255.255.0
	gateway 192.173.4.0

hwaddress ether 9e:d5:2c:df:39:32
```
- **Flamme (Laravel Worker)**
```
auto eth0
iface eth0 inet static
	address 192.173.4.2
	netmask 255.255.255.0
	gateway 192.173.4.0

hwaddress ether da:cc:d9:29:59:e8
```
- **Fern (Laravel Worker)**
```
auto eth0
iface eth0 inet static
	address 192.173.4.1
	netmask 255.255.255.0
	gateway 192.173.4.0

hwaddress ether 8a:31:c6:e6:a2:7b
```
- **Lawine (PHP Worker)**
```
auto eth0
iface eth0 inet static
	address 192.173.3.3
	netmask 255.255.255.0
	gateway 192.173.3.0

hwaddress ether 8e:c1:16:c2:6d:4b
```
- **Linie (PHP Worker)**
```
auto eth0
iface eth0 inet static
	address 192.173.3.2
	netmask 255.255.255.0
	gateway 192.173.3.0

hwaddress ether 7a:e7:1c:d2:ae:44
```
- **Lugner (PHP Worker)**
```
auto eth0
iface eth0 inet static
	address 192.173.3.1
	netmask 255.255.255.0
	gateway 192.173.3.0

hwaddress ether 8a:02:fd:bb:05:be
```
- **Revolte, Richter, Sein, dan Stark (Client)**
```
auto eth0
iface eth0 inet dhcp
```

### Sebelum Memulai 
setiap node, kita inisiasi pada `.bashrc` menggunakan `nano`

- DNS Server
  ```sh
  echo 'nameserver 192.168.122.1' > /etc/resolv.conf
  apt-get update
  apt-get install bind9 -y  
  ```
- DHCP Server
  ```sh
  echo 'nameserver 192.173.1.2' > /etc/resolv.conf   # Pastikan DNS Server sudah berjalan 
  apt-get update
  apt install isc-dhcp-server -y
  ```
- DHCP Relay
  ```sh
  apt-get update
  apt install isc-dhcp-relay -y
  ```
- Database Server
  ```sh
  echo 'nameserver 192.173.1.2' > /etc/resolv.conf
  apt-get update
  apt-get install mariadb-server -y
  service mysql start

  Lalu jangan lupa untuk mengganti [bind-address] pada file /etc/mysql/mariadb.conf.d/50-server.cnf menjadi 0.0.0.0 dan jangan lupa untuk melakukan restart mysql kembali
  ```
- Load Balancer
  ```sh
  echo 'nameserver 192.173.1.2' > /etc/resolv.conf
  apt-get update
  apt-get install apache2-utils -y
  apt-get install nginx -y
  apt-get install lynx -y

  service nginx start
  ```
- Worker PHP
  ```sh
  echo 'nameserver 192.173.1.2' > /etc/resolv.conf
  apt-get update
  apt-get install nginx -y
  apt-get install wget -y
  apt-get install unzip -y
  apt-get install lynx -y
  apt-get install htop -y
  apt-get install apache2-utils -y
  apt-get install php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip -y

  service nginx start
  service php7.3-fpm start
  ```
- Worker Laravel
  ```sh
  echo 'nameserver 192.173.1.2' > /etc/resolv.conf
  apt-get update
  apt-get install lynx -y
  apt-get install mariadb-client -y
  # Test connection from worker to database
  # mariadb --host=192.173.2.1 --port=3306   --user=kelompoka09 --password=passworda09 dbkelompoka09 -e "SHOW DATABASES;"
  apt-get install -y lsb-release ca-certificates a   apt-transport-https software-properties-common gnupg2
  curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg
  sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
  apt-get update
  apt-get install php8.0-mbstring php8.0-xml php8.0-cli   php8.0-common php8.0-intl php8.0-opcache php8.0-readline php8.0-mysql php8.0-fpm php8.0-curl unzip wget -y
  apt-get install nginx -y

  service nginx start
  service php8.0-fpm start
  ```
- Client
  ```sh
  apt update
  apt install lynx -y
  apt install htop -y
  apt install apache2-utils -y
  apt-get install jq -y
  ```

## Soal 1 
>Lakukan konfigurasi sesuai dengan peta yang sudah diberikan.

Pertama kita perlu mempersiapkan konfigurasi topologi dan [setup](#sebelum-memulai) seperti aturan diatas. Selanjutnya untuk kebutuhan testing, kita perlu menambahkan register domain berupa ``riegel.canyon.a09.com`` untuk worker Laravel dan granz.channel.a09.com untuk worker PHP yang mengarah pada worker dengan IP ``192.173.x.1``. Karena pada konfirgurasi topologi sebelumnya seluruh worker sudah menggunakan DHCP, maka kita perlu modifikasi sedikit pada node ``Lugner`` dan ``Fern`` seperti dibawah ini
- **Lugner (PHP Worker)**
```
auto eth0
iface eth0 inet static
	address 192.173.3.1
	netmask 255.255.255.0
	gateway 192.173.3.0
```
- **Fern (Laravel Worker)**
```
auto eth0
iface eth0 inet static
	address 192.173.4.1
	netmask 255.255.255.0
	gateway 192.173.4.0
```

Selanjutnya pada DNS Server (Heiter), kita perlu menjalankan command dibawah ini

### Script
```sh
echo 'zone "riegel.canyon.a09.com" {
    type master;
    file "/etc/bind/sites/riegel.canyon.a09.com";
};

zone "granz.channel.a09.com" {
    type master;
    file "/etc/bind/sites/granz.channel.a09.com";
};

zone "1.173.192.in-addr.arpa" {
    type master;
    file "/etc/bind/sites/1.173.192.in-addr.arpa";
};' > /etc/bind/named.conf.local

mkdir -p /etc/bind/sites
cp /etc/bind/db.local /etc/bind/sites/riegel.canyon.a09.com
cp /etc/bind/db.local /etc/bind/sites/granz.channel.a09.com
cp /etc/bind/db.local /etc/bind/sites/1.173.192.in-addr.arpa

echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     riegel.canyon.a09.com. root.riegel.canyon.a09.com. (
                        2023111401      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      riegel.canyon.a09.com.
@       IN      A       192.173.4.1     ; IP Fern
www     IN      CNAME   riegel.canyon.a09.com.' > /etc/bind/sites/riegel.canyon.a09.com

echo '
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     granz.channel.a09.com. root.granz.channel.a09.com. (
                        2023111401      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      granz.channel.a09.com.
@       IN      A       192.173.3.1     ; IP Lugner
www     IN      CNAME   granz.channel.a09.com.' > /etc/bind/sites/granz.channel.a09.com

echo 'options {
      directory "/var/cache/bind";

      forwarders {
              192.168.122.1;
      };

      // dnssec-validation auto;
      allow-query{any;};
      auth-nxdomain no;    # conform to RFC1035
      listen-on-v6 { any; };
}; ' >/etc/bind/named.conf.options

service bind9 start
```
### Result

![image](https://github.com/Caknoooo/Jarkom-Modul-3-A09-2023/assets/92737767/a1d913cc-ca57-4da7-ba7d-ddcbc9a2ddb8)

![image](https://github.com/Caknoooo/Jarkom-Modul-3-A09-2023/assets/92737767/0687bed4-f1dc-4409-b188-ce4c2c55c13a)

## Soal 2
>Semua CLIENT harus menggunakan konfigurasi dari DHCP Server. Client yang melalui Switch3 mendapatkan range IP dari [prefix IP].3.16 - [prefix IP].3.32 dan [prefix IP].3.64 - [prefix IP].3.80

Sebelum mengerjakan perlu untuk melakukan [setup](#sebelum-memulai) untuk DHCP Server terlebih dahulu. Selanjutnya kita perlu menjalankan command dibawah ini pada DHCP Server
### Script 
```sh
echo 'subnet 192.173.1.0 netmask 255.255.255.0 {
}

subnet 192.173.2.0 netmask 255.255.255.0 {
}

subnet 192.173.3.0 netmask 255.255.255.0 {
    range 192.173.3.16 192.173.3.32;
    range 192.173.3.64 192.173.3.80;
    option routers 192.173.3.0;
}' > /etc/dhcp/dhcpd.conf
```

## Soal 3 
>Client yang melalui Switch4 mendapatkan range IP dari [prefix IP].4.12 - [prefix IP].4.20 dan [prefix IP].4.160 - [prefix IP].4.168

Selanjutnya kita perlu menambahkan beberapa konfigurasi baru untuk switch4 dengan menjalankan command dibawah ini

### Script 
```sh
echo 'subnet 192.173.1.0 netmask 255.255.255.0 {
}

subnet 192.173.2.0 netmask 255.255.255.0 {
}

subnet 192.173.3.0 netmask 255.255.255.0 {
    range 192.173.3.16 192.173.3.32;
    range 192.173.3.64 192.173.3.80;
    option routers 192.173.3.0;
}

subnet 192.173.4.0 netmask 255.255.255.0 {
    range 192.173.4.12 192.173.4.20;
    range 192.173.4.160 192.173.4.168;
    option routers 192.173.4.0;
} ' > /etc/dhcp/dhcpd.conf
```

## Soal 4 
>Client mendapatkan DNS dari Heiter dan dapat terhubung dengan internet melalui DNS tersebut

kita akan menambahkan beberapa konfigurasi seperti ``option broadcast-address`` dan ``option domain-name-server`` agar dapat DNS yang telah disiapkan sebelumnya dapat digunakan

### Script
```sh 
subnet 192.173.3.0 netmask 255.255.255.0 {
    ...
    option broadcast-address 192.173.3.255;
    option domain-name-servers 192.173.1.2;
    ...
}

subnet 192.173.4.0 netmask 255.255.255.0 {
    option broadcast-address 192.173.4.255;
    option domain-name-servers 192.173.1.2;
} 
```

Lalu gunakan ``shell`` script sebagai berikut

```sh
echo 'subnet 192.173.1.0 netmask 255.255.255.0 {
}

subnet 192.173.2.0 netmask 255.255.255.0 {
}

subnet 192.173.3.0 netmask 255.255.255.0 {
    range 192.173.3.16 192.173.3.32;
    range 192.173.3.64 192.173.3.80;
    option routers 192.173.3.0;
    option broadcast-address 192.173.3.255;
    option domain-name-servers 192.173.1.2;
}

subnet 192.173.4.0 netmask 255.255.255.0 {
    range 192.173.4.12 192.173.4.20;
    range 192.173.4.160 192.173.4.168;
    option routers 192.173.4.0;
    option broadcast-address 192.173.4.255;
    option domain-name-servers 192.173.1.2;
} ' > /etc/dhcp/dhcpd.conf

service isc-dhcp-server start
```

Selanjutnya kita perlu untuk melakukan [setup](#sebelum-memulai) untuk DHCP Relay terlebih dahulu. Selanjutnya kita perlu menjalankan command dibawah ini pada DHCP Relay
```sh
echo '# Defaults for isc-dhcp-relay initscript
# sourced by /etc/init.d/isc-dhcp-relay
# installed at /etc/default/isc-dhcp-relay by the maintainer scripts

#
# This is a POSIX shell fragment
#

# What servers should the DHCP relay forward requests to?
SERVERS="192.173.1.1"

# On what interfaces should the DHCP relay (dhrelay) serve DHCP requests?
INTERFACES="eth1 eth2 eth3 eth4"

# Additional options that are passed to the DHCP relay daemon?
OPTIONS=""' > /etc/default/isc-dhcp-relay

service isc-dhcp-relay start 
```

Lalu pada file ``/etc/sysctl.conf`` lakukan uncommented pada ``net.ipv4.ip_forward=1``

Terakhir jangan lupa untuk restart seluruh client agar dapat melakukan leasing IP dari DHCP Server

### Result

![image](https://github.com/Caknoooo/Jarkom-Modul-3-A09-2023/assets/92737767/aef2db26-cbfe-4ab8-ab15-2edc200db28e)

![image](https://github.com/Caknoooo/Jarkom-Modul-3-A09-2023/assets/92737767/a0bf3231-515a-4458-8066-930b82bde56d)


## Soal 5
>Lama waktu DHCP server meminjamkan alamat IP kepada Client yang melalui Switch3 selama 3 menit sedangkan pada client yang melalui Switch4 selama 12 menit. Dengan waktu maksimal dialokasikan untuk peminjaman alamat IP selama 96 menit

Kita perlu menggunakan bantuan fungsi ``default-lease-time`` dan ``max-lease-team`` dimana satuannya adalah detik.

Karena pada ``switch3`` dapat meminjamkan IP selama ``3 Menit`` dan ``Switch4`` dapat meminjamkan IP selama ``5 Menit``. Sehingga pada ``Switch3`` membutuhkan waktu ``180 s`` dan ``Switch4`` membutuhkan waktu ``300 s`` dan untuk ``max-lease-time`` nya adalah ``96 menit`` dimana akan menjadi ``5760 s``
 
Selanjutnya kita perlu menambahkan beberapa konfigurasi baru untuk mengatur leasing time pada switch3 dan switch4 sesuai dengan aturan soal. Kita dapat menjalankan command berikut pada DHCP Server

### Script
```sh
echo 'subnet 192.173.1.0 netmask 255.255.255.0 {
}

subnet 192.173.2.0 netmask 255.255.255.0 {
}

subnet 192.173.3.0 netmask 255.255.255.0 {
    range 192.173.3.16 192.173.3.32;
    range 192.173.3.64 192.173.3.80;
    option routers 192.173.3.0;
    option broadcast-address 192.173.3.255;
    option domain-name-servers 192.173.1.2;
    default-lease-time 180;
    max-lease-time 5760;
}

subnet 192.173.4.0 netmask 255.255.255.0 {
    range 192.173.4.12 192.173.4.20;
    range 192.173.4.160 192.173.4.168;
    option routers 192.173.4.0;
    option broadcast-address 192.173.4.255;
    option domain-name-servers 192.173.1.2;
    default-lease-time 720;
    max-lease-time 5760;
}

service isc-dhcp-server restart
```
### Result

![image](https://github.com/Caknoooo/Jarkom-Modul-3-A09-2023/assets/92737767/501ff778-5836-4528-a07b-079b3d48d6f9)

![image](https://github.com/Caknoooo/Jarkom-Modul-3-A09-2023/assets/92737767/d69c7a22-2752-4e6b-8539-23d39303ca4d)

## Soal 6
> Pada masing-masing worker PHP, lakukan konfigurasi virtual host untuk website berikut dengan menggunakan php 7.3. (6)

Sebelum mengerjakan perlu untuk melakukan [setup](#sebelum-memulai) terlebih dahulu pada **seluruh PHP Worker**. Jika sudah, silahkan untuk melakukan konfigurasi tambahan sebagai berikut untuk melakukan download dan unzip menggunakan command ``wget``
```sh
wget -O '/var/www/granz.channel.a09.com' 'https://drive.google.com/u/0/uc?id=1ViSkRq7SmwZgdK64eRbr5Fm1EGCTPrU1&export=download'
unzip -o /var/www/granz.channel.a09.com -d /var/www/
rm /var/www/granz.channel.a09.com
mv /var/www/modul-3 /var/www/granz.channel.a09.com
```

### Script
Setelah melakukan download dan unzip. Sekarang kita bisa melakukan konfigurasi pada ``nginx`` sebagai berikut:
```sh 
cp /etc/nginx/sites-available/default /etc/nginx/sites-available/granz.channel.a09.com
ln -s /etc/nginx/sites-available/granz.channel.a09.com /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

echo 'server {
    listen 80;
    server_name _;

    root /var/www/granz.channel.a09.com;
    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php7.3-fpm.sock;  # Sesuaikan versi PHP dan socket
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
}' > /etc/nginx/sites-available/granz.channel.a09.com

service nginx restart
```

### Result 
Jalanin Perintah ``lynx localhost`` pada masing-masing worker dan hasilnya akan sebagai berikut:

![image](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/9acf27de-5b19-46d5-b1f5-6e145072992a)

## Soal 7
> Kepala suku dari Bredt Region memberikan resource server sebagai berikut: Lawine, 4GB, 2vCPU, dan 80 GB SSD. Linie, 2GB, 2vCPU, dan 50 GB SSD. Lugner 1GB, 1vCPU, dan 25 GB SSD. Aturlah agar Eisen dapat bekerja dengan maksimal, lalu lakukan testing dengan 1000 request dan 100 request/second. (7)

Sebelum mengerjakan perlu untuk melakukan [setup](#sebelum-memulai) terlebih dahulu. Setelah melakukan konfigurasi diatas, sekarang lakukan konfigurasi ``Load Balancing`` pada node ``Eisen`` sebagai berikut 

### Script
Sebelum melakukan setup soal 7. Buka kembali Node ``DNS Server`` dan arahkan ``domain`` tersebut pada ``IP Load Balancer Eisen``

```sh
echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     riegel.canyon.a09.com. root.riegel.canyon.a09.com. (
                        2023111401      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      riegel.canyon.a09.com.
@       IN      A       192.173.2.2     ; IP LB Eiken
www     IN      CNAME   riegel.canyon.a09.com.' > /etc/bind/sites/riegel.canyon.a09.com

echo '
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     granz.channel.a09.com. root.granz.channel.a09.com. (
                        2023111401      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      granz.channel.a09.com.
@       IN      A       192.173.2.2     ; IP LB Eiken
www     IN      CNAME   granz.channel.a09.com.' > /etc/bind/sites/granz.channel.a09.com
```

Lalu kembali ke node ``Eisen`` dan lakukan konfigurasi pada nginx sebagai berikut

```sh 
cp /etc/nginx/sites-available/default /etc/nginx/sites-available/lb_php

echo ' upstream worker {
    server 192.173.3.1;
    server 192.173.3.2;
    server 192.173.3.3;
}

server {
    listen 80;
    server_name granz.channel.a09.com www.granz.channel.a09.com;

    root /var/www/html;

    index index.html index.htm index.nginx-debian.html;

    server_name _;

    location / {
        proxy_pass http://worker;
    }
} ' > /etc/nginx/sites-available/lb_php

ln -s /etc/nginx/sites-available/lb_php /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

service nginx restart
```

Setelah itu lakukan [konfigurasi](#sebelum-memulai) pada salah satu client. Disini kami melakukan konfigurasi pada client ``Revolte``

### Result
Jalankan perintah berikut pada client ``Revolte``
```sh
ab -n 1000 -c 100 http://www.granz.channel.a09.com/ 
```

dan akan mendapatkan hasil seperti berikut 

![image](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/024a3bca-87d7-4fc5-a94f-0d345f8c3c90)

dan waktu yang dihasilkan adalah  ``Requests per second:    269.06 [#/sec] (mean)`` serta yang dibutuhkan adalah sebagai berikut 

![image](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/6a893591-aeac-4976-951a-189771340277)

## Soal 8
> Karena diminta untuk menuliskan grimoire, buatlah analisis hasil testing dengan 200 request dan 10 request/second masing-masing algoritma Load Balancer dengan ketentuan sebagai berikut: 1. Nama Algoritma Load Balancer; 2. Report hasil testing pada Apache Benchmark; 3.Grafik request per second untuk masing masing algoritma; 4. Analisis

Sebelum mengerjakan perlu untuk melakukan [setup](#sebelum-memulai) terlebih dahulu. Selebihnya untuk konfigurasinya sama dengan [Soal 7](#Soal-7)

Untuk laporan ``grimoire`` nya kami membuatnya di google.docs pada [link](https://docs.google.com/document/d/1mjKvsNKzQ8XagdoAB8i9nLP6MNEwcRq2ucCuLPb50F0/edit?usp=sharing) ini.

### Script
Jalankan command berikut pada client ``Revolte``
```sh
ab -n 200 -c 10 http://www.granz.channel.a09.com/ 
```

### Result 

**Round Robin**

![Screenshot (1015)](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/24ed0a1b-11a5-4aea-aed2-6ea179e6b477)

**Least-connection**

![Screenshot (1019)](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/eabe0ec0-d215-465d-8096-31473dc7c962)

**IP Hash**

![Screenshot (1020)](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/4f03715c-7da8-470a-87b1-7763c489ec78)

**Generic Hash**

![Screenshot (1021)](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/37b8d309-9917-4275-a441-2ca838fcb6b7)

**Grafik**

![image](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/5551618b-fb27-4028-915d-f5beff5616d3)

## Soal 9
> Dengan menggunakan algoritma Round Robin, lakukan testing dengan menggunakan 3 worker, 2 worker, dan 1 worker sebanyak 100 request dengan 10 request/second, kemudian tambahkan grafiknya pada grimoire. (9)

Sebelum mengerjakan perlu untuk melakukan [setup](#sebelum-memulai) terlebih dahulu. Setelah melakukan setup pada node ``Eisen`` sekarang lakukan testing pada load balancer yang telah dibuat sebelumnya. Yang menjadi pembeda adalah kita harus melakukan testing menggunakan ``1 worker``, ``2 worker``, dan ``3 worker``. 

### Script
Jalankan command berikut pada client ``Revolte``
```sh
ab -n 200 -c 10 http://www.granz.channel.a09.com/ 
```

### Result

**3 Worker**

![Screenshot (1022)](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/a05e2b8f-6a98-4283-9c1a-581a1f7c2811)

> Request per second 303.87 [#/sec] (mean)

**2 Worker**

![Screenshot (1023)](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/9d4dc1ba-9a8a-4203-9ed8-a201e2b488be)

> Request per second 336.77 [#/sec] (mean)

**1 Worker**

![Screenshot (1024)](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/bd9eab33-0d57-4244-a544-810e6910823b)

> Request per second 393.40 [#/sec] (mean)

**Grafik**

![image](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/48104721-c2a1-4cd5-860b-f40a8f253a47)

## Soal 10
> Selanjutnya coba tambahkan konfigurasi autentikasi di LB dengan dengan kombinasi username: “netics” dan password: “ajkyyy”, dengan yyy merupakan kode kelompok. Terakhir simpan file “htpasswd” nya di /etc/nginx/rahasisakita/ 

Sebelum mengerjakan perlu untuk melakukan [setup](#sebelum-memulai) terlebih dahulu. Setelah itu, lakukan beberapa konfigurasi sebagai berikut

### Script
```sh 
mkdir /etc/nginx/rahasisakita
htpasswd -c /etc/nginx/rahasisakita/htpasswd netics
```

Lalu, masukkan passwordnya ``ajka09``

Jika sudah memasukkan ``password`` dan ``re-type password``. Sekarang bisa dicoba dengan menambahkan command berikut pada setup nginx.

```sh
auth_basic "Restricted Content";
auth_basic_user_file /etc/nginx/rahasisakita/htpasswd;
```

### Result
Jadi, ketika kita mengakses kembali url ``http://www.granz.channel.a09.com/`` akan terdapat unauthorized sebagai berikut 

![image](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/17ef2476-6555-48e8-a216-bf836edc8dfc)

![image](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/c32e683b-3285-4263-be47-c234c3250ffb)

![image](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/ab94c3aa-9ff1-4275-bfc6-b038465af0e4)

**Setelah berhasil Autentikasi**

![image](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/05e43a73-f45e-41a4-bc7c-9755a18da84c)

## Soal 11
> Lalu buat untuk setiap request yang mengandung /its akan di proxy passing menuju halaman https://www.its.ac.id. (11) hint: (proxy_pass)

Sebelum mengerjakan perlu untuk melakukan [setup](#sebelum-memulai) terlebih dahulu. Setelah itu, lakukan beberapa konfigurasi tambahan pada nginx sebagai berikut 

### Script
```sh
location ~ /its {
    proxy_pass https://www.its.ac.id;
    proxy_set_header Host www.its.ac.id;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
}
```

Berikut adalah full scriptnya 
```sh
echo 'upstream worker {
    server 192.173.3.1;
    server 192.173.3.2;
    server 192.173.3.3;
}

server {
    listen 80;
    server_name granz.channel.a09.com www.granz.channel.a09.com;

    root /var/www/html;
    index index.html index.htm index.nginx-debian.html;

    location / {
        proxy_pass http://worker;
    }

    location ~ /its {
        proxy_pass https://www.its.ac.id;
        proxy_set_header Host www.its.ac.id;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}' > /etc/nginx/sites-available/lb_php
```

Maksudnya adalah ketika kita melakukan akses pada endpoint yang mengandung ``/its`` akan diarahkan oleh ``proxy_pass`` menuju ``https://www.its.ac.id``. Jadi ketika melakukan testing pada client ``Revolte`` dengan menggunakan perintah berikut 

```sh
lynx www.granz.channel.a09.com/its
```

### Result

![image](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/c1cedf3f-0eda-42c1-9b37-9dd82b614345)

## Soal 12
> Selanjutnya LB ini hanya boleh diakses oleh client dengan IP [Prefix IP].3.69, [Prefix IP].3.70, [Prefix IP].4.167, dan [Prefix IP].4.168. 

Sebelum mengerjakan perlu untuk melakukan [setup](#sebelum-memulai) terlebih dahulu. Setelah itu, Kami hanya menambahkan beberapa konfigurasi di nginx sebagai berikut 

### Script

```sh
location / {
    allow 192.173.3.69;
    allow 192.173.3.70;
    allow 192.173.4.167;
    allow 192.173.4.168;
    deny all;
    proxy_pass http://worker;
}
```

Berikut adalah full scriptnya
```sh
echo 'upstream worker {
    server 192.173.3.1;
    server 192.173.3.2;
    server 192.173.3.3;
}

server {
    listen 80;
    server_name granz.channel.a09.com www.granz.channel.a09.com;

    root /var/www/html;
    index index.html index.htm index.nginx-debian.html;

    location / {
        allow 192.173.3.69;
        allow 192.173.3.70;
        allow 192.173.4.167;
        allow 192.173.4.168;
        deny all;
        proxy_pass http://worker;
    }

    location /its {
        proxy_pass https://www.its.ac.id;
        proxy_set_header Host www.its.ac.id;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}' > /etc/nginx/sites-available/lb_php
```

Disini kami hanya mengizinkan beberapa ``IP`` saja sesuai dengan ketentual soal dan kamu menolak seluruh ``IP`` selain yang telah ditentukan soal. Untuk melakukan testingnya. Bisa dilakukan dengan membuka client yang mendapatkan ``IP 192.173.3.69 atau 192.173.3.70 atau 192.173.4.167 atau 192.173.4.168``

### Result 

**IP Deny**

![image](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/bc177f35-a148-4328-b99e-0f236d984260)

![image](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/a091d850-759b-4bdd-b02f-f2ca81fef387)

**IP Allow**

Karena IP yang diberikan random, sekarang kami akan melakukan tambahan allow pada ``IP 192.173.3.19`` pada konfigurasi sebelumnya

![image](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/bc177f35-a148-4328-b99e-0f236d984260)

```sh
location / {
    allow 192.173.3.69;
    allow 192.173.3.70;
    allow 192.173.3.19;
    allow 192.173.4.167;
    allow 192.173.4.168;
    deny all;
    proxy_pass http://worker;
}
```

![image](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/f792f249-a13a-4891-9850-09471b861447)

## Soal 13
> Semua data yang diperlukan, diatur pada Denken dan harus dapat diakses oleh Frieren, Flamme, dan Fern. (13)

Sebelum mengerjakan perlu untuk melakukan [setup](#sebelum-memulai) terlebih dahulu. Setelah itu kita buka ``Database Server`` nya yaitu ``Denken`` dan lakukan konfigurasi sebagai berikut

### Script
```sh
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
```

Lalu jangan lupa untuk mengganti ``[bind-address]`` pada file ``/etc/mysql/mariadb.conf.d/50-server.cnf`` menjadi ``0.0.0.0`` 

```sh 
cd /etc/mysql/mariadb.conf.d/50-server.cnf

# Changes
bind-address            = 0.0.0.0
```

Jangan lupa untuk restart mysql nya ``service mysql restart``

Setelah itu jalankan perintah berikut: 

```sh
mysql -u root -p
Enter password: 

CREATE USER 'kelompoka09'@'%' IDENTIFIED BY 'passworda09';
CREATE USER 'kelompoka09'@'localhost' IDENTIFIED BY 'passworda09';
CREATE DATABASE dbkelompoka09;
GRANT ALL PRIVILEGES ON *.* TO 'kelompoka09'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'kelompoka09'@'localhost';
FLUSH PRIVILEGES;
```

![image](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/dad18b05-ea3e-452e-8440-a45354143157)

### Result
Setelah itu lakukan pengecekan di salah satu Laravel Worker. Disini kami akan melakukan pengecekan pada worker ``Fern`` dengan melakukan perintah ``shell`` berikut

```sh
mariadb --host=192.173.2.1 --port=3306 --user=kelompoka09 --password=passworda09 dbkelompoka09 -e "SHOW DATABASES;"
```

![image](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/6f75d17d-e078-442b-bee0-b5082e441fc3)

## Soal 14
> Frieren, Flamme, dan Fern memiliki Granz Channel sesuai dengan quest guide berikut. Jangan lupa melakukan instalasi PHP8.0 dan Composer 

Sebelum mengerjakan perlu untuk melakukan [setup](#sebelum-memulai) terlebih dahulu. Setelah itu, lakukan konfigurasi lagi sebagai berikut

### Script
Lakukan install composer

```sh
wget https://getcomposer.org/download/2.0.13/composer.phar
chmod +x composer.phar
mv composer.phar /usr/local/bin/composer
```

Setelah itu install ``git`` dan lakukan cloning terhadap [resource](https://github.com/martuafernando/laravel-praktikum-jarkom) yang telah diberikan 

```sh
apt-get install git -y
cd /var/www && git clone https://github.com/martuafernando/laravel-praktikum-jarkom
cd /var/www/laravel-praktikum-jarkom && composer update
```

Setelah melakukan ``clone`` pada resource tersebut. Sekarang lakukan konfigurasi sebagai berikut pada masing-masing ``worker``

```sh 
cd /var/www/laravel-praktikum-jarkom && cp .env.example .env
echo 'APP_NAME=Laravel
APP_ENV=local
APP_KEY=
APP_DEBUG=true
APP_URL=http://localhost

LOG_CHANNEL=stack
LOG_DEPRECATIONS_CHANNEL=null
LOG_LEVEL=debug

DB_CONNECTION=mysql
DB_HOST=192.173.2.1
DB_PORT=3306
DB_DATABASE=dbkelompoka09
DB_USERNAME=kelompoka09
DB_PASSWORD=passworda09

BROADCAST_DRIVER=log
CACHE_DRIVER=file
FILESYSTEM_DISK=local
QUEUE_CONNECTION=sync
SESSION_DRIVER=file
SESSION_LIFETIME=120

MEMCACHED_HOST=127.0.0.1

REDIS_HOST=127.0.0.1
REDIS_PASSWORD=null
REDIS_PORT=6379

MAIL_MAILER=smtp
MAIL_HOST=mailpit
MAIL_PORT=1025
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null
MAIL_FROM_ADDRESS="hello@example.com"
MAIL_FROM_NAME="${APP_NAME}"

AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_DEFAULT_REGION=us-east-1
AWS_BUCKET=
AWS_USE_PATH_STYLE_ENDPOINT=false

PUSHER_APP_ID=
PUSHER_APP_KEY=
PUSHER_APP_SECRET=
PUSHER_HOST=
PUSHER_PORT=443
PUSHER_SCHEME=https
PUSHER_APP_CLUSTER=mt1

VITE_PUSHER_APP_KEY="${PUSHER_APP_KEY}"
VITE_PUSHER_HOST="${PUSHER_HOST}"
VITE_PUSHER_PORT="${PUSHER_PORT}"
VITE_PUSHER_SCHEME="${PUSHER_SCHEME}"
VITE_PUSHER_APP_CLUSTER="${PUSHER_APP_CLUSTER}"' > /var/www/laravel-praktikum-jarkom/.env
cd /var/www/laravel-praktikum-jarkom && php artisan key:generate
cd /var/www/laravel-praktikum-jarkom && php artisan config:cache
cd /var/www/laravel-praktikum-jarkom && php artisan migrate
cd /var/www/laravel-praktikum-jarkom && php artisan db:seed
cd /var/www/laravel-praktikum-jarkom && php artisan storage:link
cd /var/www/laravel-praktikum-jarkom && php artisan jwt:secret
cd /var/www/laravel-praktikum-jarkom && php artisan config:clear
chown -R www-data.www-data /var/www/laravel-praktikum-jarkom/storage
```

Setelah berhasil menjalankan semuanya dan tidak mendapatkan ``error``. Sekarang lakukan konfigurasi ``nginx`` sebagai berikut pada masing-masing worker dimana port nya adalah sebagai berikut 

```sh
192.173.4.1:8001; # Fern 
192.173.4.2:8002; # Flamme
192.173.4.3:8003; # Frieren
```

dan berikut merupakan konfigurasi ``nginx`` nya

```sh
echo 'server {
    listen <X>;

    root /var/www/laravel-praktikum-jarkom/public;

    index index.php index.html index.htm;
    server_name _;

    location / {
            try_files $uri $uri/ /index.php?$query_string;
    }

    # pass PHP scripts to FastCGI server
    location ~ \.php$ {
      include snippets/fastcgi-php.conf;
      fastcgi_pass unix:/var/run/php/php8.0-fpm.sock;
    }

    location ~ /\.ht {
            deny all;
    }

    error_log /var/log/nginx/implementasi_error.log;
    access_log /var/log/nginx/implementasi_access.log;
}' > /etc/nginx/sites-available/laravel-worker
```

dimana ``<X>`` merupakan port masing-masing Worker.


### Result
Setelah berhasil melakukan keseluruhan konfigurasi pada masing-masing ``worker``. Saatnya melakukan testing sebagai berikut

```sh
lynx localhost:[PORT]
```
dimana PORT yang ada adalah ``8001`` ``8002`` dan ``8003``. Sesuaikan dengan setup nginx sebelumnya.

![image](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/931d4075-3b54-43fc-86d2-e392876d42a9)


## Soal 15
> Granz Channel memiliki beberapa endpoint yang harus ditesting sebanyak 100 request dengan 10 request/second. Tambahkan response dan hasil testing pada grimoire. Untuk POST /api/auth/register

Untuk mengerjakan soal ini. Diperlukan melakukan testing menggunakan ``Apache Benchmark`` pada salah satu worker saja. Disini kami akan menggunakan worker laravel ``Fern`` yang nantinya akan menjadi worker yang akan ditesting oleh client ``Revolte``. Sebelum dilakukan testing, kami menggunakan bantuan file ``.json`` yang akan digunakan sebagai ``body`` yang akan dikirim pada endpoint ``/api/auth/register`` nantinya sebagai berikut

### Script
```sh
echo '
{
  "username": "kelompokA09",
  "password": "passwordA09",
}' > register.json
```

Lalu, lakukanlah perintah berikut dari sisis client ``Revolte`` 
```sh
ab -n 100 -c 10 -p register.json -T application/json http://192.173.4.1:8001/api/auth/register
```

### Result
Terdapat error dalam pengiriman sebanyak 100 request. Dikarenakan pada table ``users`` adalah unique. Dimana data ``username`` yang dimasukkan tidak boleh sama. Sehingga menyebabkan hanya ``1`` request saja yang diproses. ``99`` proses lainnya tidak diproses

![image](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/4f7c6a72-763c-4aed-9d33-3ba40b7ea48e)

Berikut merupakan grafik dan report yang didapat

![image](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/05097fd1-8779-4a3f-8135-15cf48848544)

## Soal 16
> Granz Channel memiliki beberapa endpoint yang harus ditesting sebanyak 100 request dengan 10 request/second. Tambahkan response dan hasil testing pada grimoire. Untuk POST /api/auth/login 

Untuk mengerjakan soal ini. Diperlukan melakukan testing menggunakan ``Apache Benchmark`` pada salah satu worker saja. Disini kami akan menggunakan worker laravel ``Fern`` yang nantinya akan menjadi worker yang akan ditesting oleh client ``Revolte``. Sebelum dilakukan testing, kami menggunakan bantuan file ``.json`` yang akan digunakan sebagai ``body`` yang akan dikirim pada endpoint ``/api/auth/login`` nantinya sebagai berikut

### Script
```sh
echo '
{
  "username": "kelompokA09",
  "password": "passwordA09",
}' > login.json
```

Lalu, lakukanlah perintah berikut dari sisis client ``Revolte`` 
```sh
ab -n 100 -c 10 -p login.json -T application/json http://192.173.4.1:8001/api/auth/login
```

### Result
Terdapat error dalam pengiriman sebanyak 100 request. Karena satu worker saja tidak kuat untuk mendapatkan request sebanyak itu 100 dalam waktu yang telah diberikan atau dengan kata lain CPU yang diterima tidak sanggup untuk memproses banyaknya request. Sehingga menyebabkan hanya ``63`` request saja yang berhasil di proses sedangkan ``37`` lainnya tidak berhasil di proses

![image](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/3e1664bc-123a-47bd-8318-2eaae62f2d3a)

![image](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/4ee43597-bef3-4c0e-bcb6-0237382a6004)

## Soal 17
> Granz Channel memiliki beberapa endpoint yang harus ditesting sebanyak 100 request dengan 10 request/second. Tambahkan response dan hasil testing pada grimoire. Untuk GET /api/me


Untuk mengerjakan soal ini. Diperlukan melakukan testing menggunakan ``Apache Benchmark`` pada salah satu worker saja. Disini kami akan menggunakan worker laravel ``Fern`` yang nantinya akan menjadi worker yang akan ditesting oleh client ``Revolte``. Sebelum dilakukan testing. Ada beberapa konfigurasi yang harus disiapkan sebagai berikut 

### Script
Dapatkan tokennya terlebih dahulu sebelum mengakses endpoint ``/api/me``

```sh
curl -X POST -H "Content-Type: application/json" -d @login.json http://192.173.4.1:8001/api/auth/login > login_output.txt
```

![image](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/40a9b98d-c737-4e03-8e95-4d0c0273fda3)

Lalu jalankan perintah berikut untuk melakukan set ``token`` secara global

```sh
token=$(cat login_output.txt | jq -r '.token')
```

Setelah itu jalankan perintah berikut untuk melakukan testing

```sh
ab -n 100 -c 10 -H "Authorization: Bearer $token" http://192.173.4.1:8001/api/me
```

### Result 
Terdapat error dalam pengiriman sebanyak 100 request. Karena satu worker saja tidak kuat untuk mendapatkan request sebanyak itu 100 dalam waktu yang telah diberikan atau dengan kata lain CPU yang diterima tidak sanggup untuk memproses banyaknya request. Sehingga menyebabkan hanya ``62`` request saja yang berhasil di proses sedangkan ``38`` lainnya tidak berhasil di proses

![image](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/f65ac13d-2b36-4e9c-8b71-43ea2d6ea827)

![image](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/c58c1181-e387-476b-a0ef-ffdbe5278614)

## Soal 18
> Untuk memastikan ketiganya bekerja sama secara adil untuk mengatur Granz Channel maka implementasikan Proxy Bind pada Eisen untuk mengaitkan IP dari Frieren, Flamme, dan Fern. 

Sebelum mengerjakan perlu untuk melakukan [setup](#sebelum-memulai) terlebih dahulu. Setelah itu, karena hanya diberikan perintah ketiga ``worker`` berjalan secara adil, kami memberikan implementasi dari ``Load Balancing`` karena sesuai dengan definisi nya yaitu membagi rata beban kerja. Maka dari itu, berikut merupakan konfigurasi ``nginx``

### Script
```sh
echo 'upstream worker {
    server 192.173.4.1:8001;
    server 192.173.4.2:8002;
    server 192.173.4.3:8003;
}

server {
    listen 80;
    server_name granz.channel.a09.com www.granz.channel.a09.com;

    location / {
        proxy_pass http://worker;
    }
} 
' > /etc/nginx/sites-available/laravel-worker

ln -s /etc/nginx/sites-available/laravel-worker /etc/nginx/sites-enabled/laravel-worker

service nginx restart
```

**Notes**
Hati-hati ``port`` tabrakan dengan ``load balancer`` dari ``php worker`` 

### Result
Setelah melakukan konfigurasi pada ``load balancer`` pada ``Eisen``. Sekarang waktunya melakukan testing pada client ``Revolte`` dengan menjalankan perintah berikut 

```sh
ab -n 100 -c 10 -p login.json -T application/json http://www.granz.channel.a09.com/api/auth/login
```

akan memperoleh hasil sebagai berikut 

![image](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/e490249c-fd50-4849-89d6-57410e0fe424)

**Fern**

![image](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/6c42fb62-4604-4b98-8ee6-37e4ed29b980)

**Flamme**

![image](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/c86dcd29-6adb-4263-8054-8ec069b6cabf)

**Frieren**

![image](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/9c85cdfb-0179-4cd7-8c51-ba5fcd9f2859)

## Soal 19
> Untuk meningkatkan performa dari Worker, coba implementasikan PHP-FPM pada Frieren, Flamme, dan Fern. Untuk testing kinerja naikkan -> pm.max_children, pm.start_servers, pm.min_spare_servers, pm.max_spare_servers sebanyak tiga percobaan dan lakukan testing sebanyak 100 request dengan 10 request/second kemudian berikan hasil analisisnya pada Grimoire.

Untuk mengerjakan soal ini terdapat beberapa penjelasan sebagai berikut 

**pm.max_children** 
Menentukan jumlah maksimum pekerja PHP (proses anak) yang dapat berjalan secara bersamaan. Nilai ini sebaiknya disesuaikan dengan kapasitas sumber daya server. Jika terlalu rendah, server mungkin tidak dapat menangani banyak permintaan secara bersamaan, sementara jika terlalu tinggi, dapat menyebabkan kelebihan beban dan kekurangan sumber daya.

**pm.start_servers**
Menentukan jumlah pekerja PHP yang akan dimulai secara otomatis ketika PHP-FPM pertama kali dijalankan atau direstart. Ini membantu dalam mengoptimalkan performa pada saat server pertama kali dimulai.

**pm.min_spare_servers**
Menentukan jumlah minimum pekerja PHP yang tetap berjalan saat server berjalan. Ini membantu menjaga agar server tetap responsif terhadap permintaan bahkan saat lalu lintas rendah.

**pm.max_spare_servers** Menentukan jumlah maksimum pekerja PHP yang dapat berjalan tetapi tidak menangani permintaan. Jumlah ini disesuaikan dengan kebutuhan untuk menangani lonjakan lalu lintas tanpa menambahkan terlalu banyak sumber daya ketika beban rendah.

Akan ada 4 konfigurasi terhadap proses ``package manager`` pada masing-masing worker yang nantinya akan dilakukan untuk testing.

### Script

**Script 1**
```sh
# Setup Awal
echo '[www]
user = www-data
group = www-data
listen = /run/php/php8.0-fpm.sock
listen.owner = www-data
listen.group = www-data
php_admin_value[disable_functions] = exec,passthru,shell_exec,system
php_admin_flag[allow_url_fopen] = off

; Choose how the process manager will control the number of child processes.

pm = dynamic
pm.max_children = 5
pm.start_servers = 2
pm.min_spare_servers = 1
pm.max_spare_servers = 3' > /etc/php/8.0/fpm/pool.d/www.conf

service php8.0-fpm restart
```

**Script 2**
```sh
echo '[www]
user = www-data
group = www-data
listen = /run/php/php8.0-fpm.sock
listen.owner = www-data
listen.group = www-data
php_admin_value[disable_functions] = exec,passthru,shell_exec,system
php_admin_flag[allow_url_fopen] = off

; Choose how the process manager will control the number of child processes.

pm = dynamic
pm.max_children = 25
pm.start_servers = 5
pm.min_spare_servers = 3
pm.max_spare_servers = 10' > /etc/php/8.0/fpm/pool.d/www.conf

service php8.0-fpm restart
```

**Script 3**
```sh
echo '[www]
user = www-data
group = www-data
listen = /run/php/php8.0-fpm.sock
listen.owner = www-data
listen.group = www-data
php_admin_value[disable_functions] = exec,passthru,shell_exec,system
php_admin_flag[allow_url_fopen] = off

; Choose how the process manager will control the number of child processes.

pm = dynamic
pm.max_children = 50
pm.start_servers = 8
pm.min_spare_servers = 5
pm.max_spare_servers = 15' > /etc/php/8.0/fpm/pool.d/www.conf

service php8.0-fpm restart
```

**Script 4**
```sh
echo '[www]
user = www-data
group = www-data
listen = /run/php/php8.0-fpm.sock
listen.owner = www-data
listen.group = www-data
php_admin_value[disable_functions] = exec,passthru,shell_exec,system
php_admin_flag[allow_url_fopen] = off

; Choose how the process manager will control the number of child processes.

pm = dynamic
pm.max_children = 75
pm.start_servers = 10
pm.min_spare_servers = 5
pm.max_spare_servers = 20' > /etc/php/8.0/fpm/pool.d/www.conf

service php8.0-fpm restart
```

### Result

**Script 1**

![image](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/f9f3a702-c699-487b-922e-4bdc9cf0f8c9)

**Script 2**

![image](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/6550d9fa-6bef-44d7-acf6-84f9d92446b6)

**Script 3**

![image](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/1353febe-e4fa-4f5c-82b8-7046d29886fd)

**Script 4**

![image](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/eb2fa242-2eb2-4580-ba64-dc296985cbf3)

## Soal 20
> Nampaknya hanya menggunakan PHP-FPM tidak cukup untuk meningkatkan performa dari worker maka implementasikan Least-Conn pada Eisen. Untuk testing kinerja dari worker tersebut dilakukan sebanyak 100 request dengan 10 request/second. (20)

Karena proses yang telah di ``konfigurasi`` sebelumnya pada masing-masing worker tepatnya pada ``package manager`` dan ternyata hasil yang diberikan juga tidak cukup untuk meningkatkan performa ``worker``. Oleh karena itu, ditambahkan ``algoritma`` pada ``load balancer`` tersebut dengan menggunakan ``Least-connection`` dimana algoritma ini akan melakukan prioritas pembagian dari beban kinerja yang paling rendah. Node master akan mencatat semua beban dan kinerja dari semua node, dan akan melakukan prioritas dari beban yang paling rendah. Sehingga diharapkan tidak ada server dengan beban yang rendah.

### Script
```sh
echo 'upstream worker {
    least_conn;
    server 192.173.4.1:8001;
    server 192.173.4.2:8002;
    server 192.173.4.3:8003;
}

server {
    listen 80;
    server_name granz.channel.a09.com www.granz.channel.a09.com;

    location / {
        proxy_pass http://worker;
    }
} 
' > /etc/nginx/sites-available/laravel-worker

service nginx restart
```

**Notes** 
Disini kami masih menggunakan ``setup`` pada ``package manager`` sebagai berikut 

```sh
pm = dynamic
pm.max_children = 75
pm.start_servers = 10
pm.min_spare_servers = 5
pm.max_spare_servers = 20
```

### Result
Jika ditambahkan Algoritma ``Load Balancing Least-connection``. Hasil yang didapatkan cukup ``signifikan`` sebagai berikut 

![image](https://github.com/Caknoooo/go-gin-clean-template/assets/92671053/76a9467a-e5e9-49b4-9ccd-0be823e29550)

Dapat disimpulkan bahwa algoritma ``Least-connection`` dapat berkerja dengan baik
