password=$(cat /dev/urandom | head -n 10 | md5sum | head -c 10)
sed -i "s#PASSWORD#$password#g" /etc/shadowsocks.json
echo "shadowsocks password is $password"
/usr/local/bin/ssserver -c etc/shadowsocks.json d start
