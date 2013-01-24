#!/bin/bash
# Script dev. par Mickael Stanislas pour Infowiki
# http://mickael-stanislas.com/
# https://github.com/InfoWiki
# http://infowiki.fr

# Definition de la variable
URL='http://repo.bukkit.org/content/groups/public/org/bukkit/craftbukkit/1.4.7-R0.1/craftbukkit-1.4.7-R0.1.jar'

# Debut de l'installation
echo "Installation serveur Minecraft"
echo "Debut du script" > $LOG_FILE
echo "Cr�ation de l'utilisateur minecraft"
useradd -m minecraft
echo "Definition du mot de passe de l'utilisateur minecraft"
passwd
clear 
echo "Connexion avec l'utilisateur minecraft"
su minecraft
#Modification Prompte Bash
cd
echo "PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'" >> .bashrc
bash
# Ajout des sources
echo "# non-free" >> /etc/apt/sources.list
echo deb http://www.duinsoft.nl/pkg debs all >> /etc/apt/source

# Ajout des souces
apt-key adv --keyserver keys.gnupg.net --recv-keys 5CB26B26
add-apt-repository ppa:arnaud-hartmann/glances-stable
apt-get update

# Installation des programmes
apt-get install zip unzip screen htop glances update-sun-jre

# Installation minecraft 
cd /home/minecraft/
wget $URL
mv craft*.jar craftbukkit.jar

# Installation du script de d�marrage
cd /etc/init.d/
wget https://raw.github.com/InfoWiki/Minecraft/master/minecraft
chmod +x minecraft

# FIN ... END
echo "Fin du script" >> $LOG_FILE

