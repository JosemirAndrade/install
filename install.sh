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


#echo "****** INSTALANDO VIRTUALBOX ****** "

#virtualbox -y && wget https://download.virtualbox.org/virtualbox/6.1.38/Oracle_VM_VirtualBox_Extension_Pack-6.1.38.vbox-extpack && sudo VBoxManage extpack install --replace  Oracle_VM_VirtualBox_Extension_Pack-6.1.38.vbox-extpack -y

echo "****** ATUALIZANDO CHROME E FIREFOX ****** "

apt install google-chrome-stable -y firefox firefox-locale-pt

echo "****** INSTALANDO VISUAL STUDIO CODE ******"

#sudo apt install software-properties-common apt-transport-https wget -y
#wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
#sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
#apt update
#sudo apt install code -y

echo "****** INSTALANDO PYTHON 3 E PIP ******"
#apt update
#apt install python3 -y pip -y

#echo "****** ATUALIZANDO OS PACOTES ****** "
#apt update

echo "****** INSTALANDO E CONFIGURANDO O EPOPTES ****** "
#apt install epoptes-client -y
#nano /etc/default/epoptes-client
#epoptes-client -c

echo "****** REMOVENDO O WINE DO SISTEMA ****** "
apt remove --purge wine-stable -y

echo "****** CRIANDO UM USUÁRIO ADMINISTRADOR PARA O SISTEMA ****** "
#adduser administrador
#sudo useradd -m aluno


echo "****** DEFININDO SENHA PARA O USUARIO ADMINISTRADOR ****** "
#passwd administrador
#passwd aluno


#echo "****** MODIFICANDO CONFIGURAÇÕES DE ENERGIA ****** "


#echo "****** INSTALANDO ARDUINO IDE ****** "
#wget https://downloads.arduino.cc/arduino-1.8.16-linux64.tar.xz -O arduino-version.tar.xz
#tar xf arduino-version.tar.xz
#cd arduino-1.8.16
#./install.sh
#cd.. 
#rm arduino-1.8.16
#rm arduino-version.tar.xz
#chmod -R 777 /root/arduino-*
#mv /root/arduino-* /home/aluno/

#echo "****** INSTALANDO CODEBLOCKS ****** "
#sudo add-apt-repository ppa:damien-moore/codeblocks-stable
#sudo apt-get update
#sudo apt-get install codeblocks -y
#codeblocks

#echo "****** INSTALANDO PYCHARM ****** "
#sudo add-apt-repository -y ppa:viktor-krivak/pycharm
#apt update
#apt install pycharm -y

#cp -r /home/administrador/.config/ /home/aluno/

#INSTALANDO AUDACITY
#sudo add-apt-repository ppa:audacity-team/daily
#sudo apt-get update
#sudo apt-get install audacity

Instalando EPOPTES
#apt install epoptes-client
#nano /etc/default/epoptes-client
#epoptes-client -c

echo "****** REMOVENDO O SCRIPT ****** "
#rm /home/aluno/labtools
'
#users-admin
#xfce4-power-manager-settings
#xfce4-screensaver-preferences
