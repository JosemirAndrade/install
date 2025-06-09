#!/bin/sh  

zenity --info --width=250 --height=110 --text "<b><span color=\'green\'>CENTRAL DE PROGRAMAS</span></b> 
A lista de programas será instalada em breve, mas antes de prosseguir, realize login como <b>administrador do sistema</b>"

pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY bash -c '

echo "****** ATUALIZANDO OS PACOTES E REPARANDO ****** "
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
apt update
apt remove --purge samba-common-bin libpam-mount -y
dpkg --configure -a

apt install gnupg software-properties-common -y
mkdir -m755 -p /etc/apt/keyrings  # not needed since apt version 2.4.0 like Debian 12 and Ubuntu 22 or newer 
wget -O /etc/apt/keyrings/qgis-archive-keyring.gpg https://download.qgis.org/downloads/qgis-archive-keyring.gpg -y

sudo apt update

sudo apt install qgis qgis-plugin-grass -y

echo "****** ATUALIZANDO CHROME E FIREFOX ****** "
apt install google-chrome-stable -y firefox firefox-locale-pt

#echo "****** INSTALANDO E CONFIGURANDO O EPOPTES ****** "
#apt install epoptes-client -y
#nano /etc/default/epoptes-client
#epoptes-client -c

#echo "****** REMOVENDO O WINE DO SISTEMA ****** "
apt remove --purge wine-stable -y

echo "****** REMOVENDO O SCRIPT ****** "
rm ~/in-stall
'
#users-admin
#xfce4-power-manager-settings
#xfce4-screensaver-preferences
