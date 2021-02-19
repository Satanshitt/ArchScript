#!/bin/bash

clear
echo -e "User and password control settings."
sleep 3
#arch-root /mnt
clear

inputs=false
while ! $inputs; do
    clear
    username=$(dialog --backtitle "Username" --nocancel \
        --inputbox "Username \
        \nPlease insert a user:" \
        12 80 "user" 3>&1 1>&2 2>&3)

    password=$(dialog --backtitle "Password" --nocancel \
        --inputbox "Password \
        \nPlease insert a password:" \
        12 80 "123456" 3>&1 1>&2 2>&3)

    passroot=$(dialog --backtitle "Password (ROOT)" --nocancel \
        --inputbox "Password (ROOT) \
        \nPlease insert a password:" \
        12 80 "123456" 3>&1 1>&2 2>&3)

    if [ -z "$username" ] || [ -z "$password" ] || [ -z "$passroot" ]; then
        dialog --title "ERROR: He hasn't introduced anything." \
            --msgbox "You need to enter the corresponding data for the computer." 5 55
    elif [ $password == $passroot ]; then
        dialog --title "ERROR: Looks like you're using the same password." \
            --msgbox "To prevent possible errors, use two different passwords." 5 55
    else
        clear
        echo "Loading.."
        sleep 3
        #useradd -m -g users -G audio,lp,optical,storage,video,wheel,games,power,scanner -s /bin/bash $Username
        #passwd $username $Password
        #passwd $passroot
        sleep 2
        clear

        echo -e "Configuration swap file"
        #dd if=/dev/zero of=/swapfile bs=1M count=2048
        #chmod 600 /swapfile
        #mkswap /swapfile
        #swapon /swapfile
        #echo "/swapfile none swap defaults 0 0" > /etc/fstab
        sleep 2
        clear

        echo -e "Configuration timezone and locale"
        #ln -sf /usr/share/zoneinfo/Armerica/Argentina/Cordoba /etc/localtime
        #hwclock --systohc
        #echo "LANG=es_US.UTF-8" > /etc/locale.conf
        #echo "linux" > /etc/hostname
        #echo "127.0.0.1 localhost\::1 localhost\127.0.0.1 linux.localdomain linux" > /etc/hosts
        #echo "KEYMAP=la-latin1" > /etc/vconsole.conf
        sleep 2
        clear

        echo -e "Configuration networkmanager"
        #systemctl start NetworkManager
        #systemctl enable NetworkManager
        sleep 2
        clear 

        echo -e "Install and configuration grub"
        #pacman -S grub efibootmgr
        #grub-install --target=x86_64-efi --efi-directory=/boot/EFI --bootloader-id=GRUB
        #grun-mkconfig -o /boot/grub/grub.cfg
        sleep 2
        clear

        echo -e "Install others programs"
        #pacman -S telegram-desktop xorg sudo gdm xf86-video-intel 
        sleep 2
        clear

        echo -e "Configuration sudo"
        #nano /etc/sudoers
        sleep 2
        clear

        echo -e "Install desktop"
        #pacman -S xfce4 xfce4-goodies lightdm lightdm-gtk-greeter
        #ystemctl enable lightdm
        echo "si"
        
        inputs=true
    fi

done
