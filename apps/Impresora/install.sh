IP: 10.1.14.141

apt-cache search foomatic
apt-cache search gutenprint
apt-cache search printer

service cups status || 


sudo apt-get install cups
printer-driver-gutenprint


sudo apt-get install foomatic-db-ppds gutenprint-cups printer-filters
sudo apt-get install cups-pdf
sudo apt-get install hpijs 
sudo apt-get install hplip-hpijs
sudo apt-get install system-config-printer cups-pk-helper
service cups restart


system-config-firewall
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 631 -j ACCEPT
iptables -A INPUT -m state --state NEW -m udp -p udp --dport 631 -j ACCEPT
service iptables save

OR
/etc/sysconfig/iptables
-A INPUT -m state --state NEW -m tcp -p tcp --dport 631 -j ACCEPT
-A INPUT -m state --state NEW -m udp -p udp --dport 631 -j ACCEPT
service iptables restart

##############
iptables -A INPUT -m state --state NEW -m udp -p udp --dport 631 -j ACCEPT
service iptables save

O bien añada lo siguiente al archivo /etc/sysconfig/iptables:
-A INPUT -m state --state NEW -m udp -p udp --dport 631 -j ACCEPT

service iptables restart
