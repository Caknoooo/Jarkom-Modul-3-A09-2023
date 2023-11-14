echo 'nameserver 192.173.1.2' > /etc/resolv.conf
apt-get update
apt install isc-dhcp-server -y

# 2
# Client yang melalui Switch3 mendapatkan range IP dari [prefix IP].3.16 - [prefix IP].3.32 dan [prefix IP].3.64 - [prefix IP].3.80 (2)
echo 'subnet 192.173.1.0 netmask 255.255.255.0 {
}

subnet 192.173.2.0 netmask 255.255.255.0 {
}

subnet 192.173.3.0 netmask 255.255.255.0 {
    range 192.173.3.16 192.173.3.32;
    range 192.173.3.64 192.173.3.80;
    option routers 192.173.3.0;
}' > /etc/dhcp/dhcpd.conf

# 3
# Client yang melalui Switch4 mendapatkan range IP dari [prefix IP].4.12 - [prefix IP].4.20 dan [prefix IP].4.160 - [prefix IP].4.168 (3)
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

# 4
# Client mendapatkan DNS dari Heiter dan dapat terhubung dengan internet melalui DNS tersebut (4)
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

# 5
# Lama waktu DHCP server meminjamkan alamat IP kepada Client yang melalui Switch3 selama 3 menit sedangkan pada client yang melalui Switch4 selama 12 menit. Dengan waktu maksimal dialokasikan untuk peminjaman alamat IP selama 96 menit (5)
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

host Lawine {
    hardware ethernet 8e:c1:16:c2:6d:4b;
    fixed-address 192.173.3.3;
}

host Linie {
    hardware ethernet 7a:e7:1c:d2:ae:44;
    fixed-address 192.173.3.2;
}

host Lunger {
    hardware ethernet 8a:02:fd:bb:05:be;
    fixed-address 192.173.3.1;
}

host Frieren {
    hardware ethernet 9e:d5:2c:df:39:32;
    fixed-address 192.173.4.3;
}

host Flamme {
    hardware ethernet da:cc:d9:29:59:e8;
    fixed-address 192.173.4.2;
}

host Fern {
    hardware ethernet 8a:31:c6:e6:a2:7b;
    fixed-address 192.173.4.1;
}' > /etc/dhcp/dhcpd.conf

echo '# Defaults for isc-dhcp-server (sourced by /etc/init.d/isc-dhcp-server)

# Path to dhcpd's config file (default: /etc/dhcp/dhcpd.conf).
#DHCPDv4_CONF=/etc/dhcp/dhcpd.conf
#DHCPDv6_CONF=/etc/dhcp/dhcpd6.conf

# Path to dhcpd's PID file (default: /var/run/dhcpd.pid).
#DHCPDv4_PID=/var/run/dhcpd.pid
#DHCPDv6_PID=/var/run/dhcpd6.pid

# Additional options to start dhcpd with.
#       Don't use options -cf or -pf here; use DHCPD_CONF/ DHCPD_PID instead
#OPTIONS=""

# On what interfaces should the DHCP server (dhcpd) serve DHCP requests?
#       Separate multiple interfaces with spaces, e.g. "eth0 eth1".
INTERFACESv4="eth0"' > /etc/default/isc-dhcp-server

service isc-dhcp-server start