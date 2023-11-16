echo 'nameserver 192.173.1.2' > /etc/resolv.conf
apt-get update
apt-get install -y lsb-release ca-certificates apt-transport-https software-properties-common gnupg2
curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg
sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
apt-get update
apt-get install php8.0-mbstring php8.0-xml php8.0-cli php8.0-common php8.0-intl php8.0-opcache php8.0-readline php8.0-mysql php8.0-fpm php8.0-curl unzip wget -y
apt-get install nginx -y
service nginx start
service php8.0-fpm start

cp /etc/nginx/sites-available/default /etc/nginx/sites-available/laravel-worker
# unlink
unlink /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/laravel-worker /etc/nginx/sites-enabled/laravel-worker

# No 18
# Untuk memastikan ketiganya bekerja sama secara adil untuk mengatur Granz Channel maka implementasikan Proxy Bind pada Eisen untuk mengaitkan IP dari Frieren, Flamme, dan Fern. (18)
echo 'upstream worker {
    server 192.173.4.1:8001;
    server 192.173.4.2:8002;
    server 192.173.4.3:8003;
}

server {
    listen 80;
    server_name riegel.canyon.a09.com www.riegel.canyon.a09.com;

    location / {
        proxy_pass http://worker;
    }
} 
' > /etc/nginx/sites-available/laravel-worker

service nginx restart

