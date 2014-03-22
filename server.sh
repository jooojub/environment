#!/bin/bash

if [ "$1" = "install" ];then
    set -e
    # Aache2
    sudo apt-get install apache2
    # Mysql5
    sudo apt-get install mysql-server mysql-client
    # PHP5
    sudo apt-get install php5 php5-common
    # Apache Peristalsis with PHP
    sudo apt-get install libapache2-mod-php5
    # PHP Peristalsis with Mysql
    sudo apt-get install php5-mysql

elif [ "$1" = "restart" ];then
    echo "** Apache restart **"
    sudo /etc/init.d/apache2 restart
    echo "** Mysql restart **"
    sudo /etc/init.d/mysql restart
elif [ "$1" = "test" ];then
    echo "** server test **"
    sudo netstat -atp | grep apache2
    sudo netstat -atp | grep mysqld

elif [ "$1" = "smbclient" ];then
    # sudo vi /etc/hosts
    smbclient -L jooojub-PC
    smbclient //jooojub-PC/down -U jooojub%dkdlvl

elif [ "$1" = "smbmount" ];then
    eval sudo mkdir -p /mnt/win
    eval sudo mount -t cifs //jooojub-PC/down ~/share_win

elif [ "$1" = "toolchain" ];then
    wget http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/arm-2013.11-33-arm-none-linux-gnueabi.bin
#    chmod x+ .bin
#sudo ln -s /home/jooojub/MentorGraphics/Sourcery_CodeBench_Lite_for_ARM_GNU_Linux/bin/arm-none-linux-gnueabi-* /usr/bin

else
    echo "install, restart, test, smbclient, smbmount"
fi
