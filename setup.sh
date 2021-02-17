#!/bin/bash

echo -e "> Setting the corresponding time zone."
#timedatectl set-ntp true
#mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
#curl -s "https://www.archlinux.org/mirrorlist/?country=US&protocol=http&protocol=https&ip_version=4&ip_version=6&use_mirror_status=on" | sed -e "s/^#Server/Server/g" > /etc/pacman.d/mirrorlist
#pacman -Syy
clear

echo -e "> Partitioning."
sleep 2
echo ""
lsblk

echo ""
echo -e "Please enter disk to install Arch Linux on: (example /dev/sda)"
read DISK

if ls "$DISK"; then
    for i in $(seq 1 100); do
        sleep 0.1
        echo $i
        #sgdisk -Z ${DISK}
        #sgdisk -a 2048 -o ${DISK}

        #sgdisk -n 1:0:+512M ${DISK}
        #sgdisk -n 2:0:+300G ${DISK}
        #sgdisk -n 3:0:0 ${DISK}

        #mkfs.fat -F32 "${DISK}1"
        #mkfs.ext4 "${DISK}2"
        #mkfs.ext4 "${DISK}3"

        #mount "${DISK}2" /mnt
        #mkdir -p /mnt/boot/EFI
        #mount "${DISK}1" /mnt/boot/EFI
        #mkdir /mnt/home
        #mount "${DISK}3" /mnt/home/
    done | dialog --title 'Setting up partitions' --gauge 'Running...' 6 60 0
    clear
    #pacstrap /mnt base linux linux-firmware nano networkmanager network-manager-applet wireless_tools wpa_supplicant os-prober mtools dosfstools base-devel linux-headers --noconfirm
    #genfstab -U /mnt >> /mnt/etc/fstab
    clear
    sleep 1
    echo -e "Finishing configuring the partitions.."
    #sh install.sh
else
    clear
    echo "Please insert a valid disk in order to partition."
fi
