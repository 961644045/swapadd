#!/usr/bin/bash
echo '例：请输入你需要设置的swap大小：4'
read -p "请输入你需要设置的swap大小：" neicun
echo
echo "你要增加的内存为：$neicun"'G'
echo
shi=10
daxiao=`expr $neicun \* $shi`
dd if=/dev/zero of=/$neicun'G' bs=100M count=$daxiao
chmod 755 /etc/rc.d/rc.local
echo "swapon -a /$neicun"'G' >> /etc/rc.d/rc.local
mkswap /$neicun'G'
swapon -a /$neicun'G'
rm -rf swapadd.sh
