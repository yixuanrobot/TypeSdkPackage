#!/bin/sh
setenforce 0
echo -e "\033[31m ###################################################################################################### \033[0m"
echo -e "\033[32m ################################### install typesdkPackge                    ################################### \033[0m"
echo -e "\033[32m ################################### website:http://www.typesdk.com ################################### \033[0m"
echo -e "\033[32m ################################### QQ:1771930259                  ################################### \033[0m"
echo -e "\033[31m ###################################################################################################### \033[0m"
read -p "Input TypeSDK Manager server IP:Port :" manager_ip
yum -y install git
git clone https://code.csdn.net/typesdk/software.git
useradd sdk
ln -s /dev/shm /data/typesdk.tmp
chown -R sdk.sdk /data/typesdk.tmp /data/typesdk
yum -y install unzip
yum -y install xorg-x11-xauth
yum -y groupinstall chinese-support
yum -y install /lib/ld-linux.so.2
yum -y install libz.so.1
yum -y install libgcc
yum -y install libgcc_s.so.1
yum -y install samba
yum -y install cifs-utils
rm -f /etc/samba/smb.conf
cp /data/typesdk/install/smb.conf /etc/samba/
chkconfig smb on
chkconfig nmb on
service smb restart
service nmb restart
cat /data/typesdk/install/export_home.txt >> /etc/profile
cp /data/typesdk/package/server/config.json.bak /data/typesdk/package/server/config.json
sed -i "s/managerserver/$manager_ip/" /data/typesdk/package/server/config.json
ln -s /data/typesdk/package/shell/startTypeSdkPackage.sh /data/typesdk/startTypeSdkPackage.sh