#!/bin/bash

sudo snap remove snap-store
sudo snap remove gtk-common-themes
sudo snap remove gnome-3-28-1804
sudo snap remove gnome-3-34-1804
sudo snap remove core18
sudo snap remove snapd
snap list # expect: No snaps are installed yet. Try 'snap install hello-world'.
 
sudo umount /run/snap/ns
 
sudo systemctl disable snapd.service
sudo systemctl disable snapd.socket
sudo systemctl disable snapd.seeded.service
sudo systemctl disable snapd.autoimport.service
sudo systemctl disable snapd.apparmor.service
 
sudo rm -rf /etc/apparmor.d/usr.lib.snapd.snap-confine.real
 
sudo systemctl start apparmor.service
 
sudo umount /snap/chromium/1424
sudo umount /snap/gtk-common-themes/1514
sudo umount /snap/gnome-3-28-1804/145
sudo umount /snap/core18/1944
sudo umount /snap/snapd/10492
sudo umount /var/snap
 
sudo apt purge snapd
 

rm -rf ~/snap
sudo rm -rf /snap /var/snap /var/lib/snapd /var/cache/snapd /usr/lib/snapd
sudo rm -rf /root/snap /root/snap/snap-store /usr/share/doc/libsnapd-glib1 /usr/share/doc/gir1.2-snapd-1
 
cat <<EOF | sudo tee /etc/apt/preferences.d/snapd
Package: snapd
Pin: origin *
Pin-Priority: -1
EOF
 
cat <<EOF | sudo tee /etc/apt/preferences.d/pin-xalt7x-chromium-deb-vaapi
Package: *
Pin: release o=LP-PPA-xalt7x-chromium-deb-vaapi
Pin-Priority: 1337
EOF
 


