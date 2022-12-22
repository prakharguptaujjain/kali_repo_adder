#/bin/bash

if (( $EUID != 0 )); then
    echo "Please run as root"
    exit
fi

echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" | sudo tee /etc/apt/sources.list
name=$(curl -s https://http.kali.org/kali/pool/main/k/kali-archive-keyring/ | grep "all.deb" | awk -F'[<>]' '{for (i=1; i<=NF; i++) print $i}' | grep "all.deb" | sed -n '2p')
wget https://http.kali.org/kali/pool/main/k/kali-archive-keyring/$name
sudo apt install ./$name
sudo apt update
rm $name


