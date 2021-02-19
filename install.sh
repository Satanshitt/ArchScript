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
        echo "$username"
        echo "$password"
        echo "$passroot"
        inputs=true
    fi

done
