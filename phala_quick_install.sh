#!/bin/sh
# This is just a little script downloaded form github to quickly get you
# started with a phala-node. It just does platform detection, 
# downloads required programs, such as rust if not installed yet.

FILE="/tmp/out.$$"
GREP="/bin/grep"

# this script needs root privalages
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root. Execute script with 'sudo' " 1>&2
   exit 1
fi

#updating package dependencies, required to find packages
# if package base is not up to date yet
echo ""
echo "[+] updating package dependencies"
apt update

#install clang
echo ""
echo "[+] Checking if clang is installed"
(dpkg-query -W -f='${Status}' curl 2>/dev/null | grep -c "ok installed")
if [ $? -eq 0 ]; then
    echo "Package $1 is installed!"
else
    echo "Package $1 is NOT installed!"
    echo -n "Do you wish to install clang (y/n)? "
    read answer
    if [ "$answer" != "${answer#[Yy]}" ] ;then 
    echo Yes
    echo "[+] updating package dependencies"
    apt update
    echo "[+] installing curl package to retrieve rust install script"
    apt install clang
    else
    echo No
    fi
fi

#Check if Curl is installed:
echo ""
echo "[+] Checking if Curl is installed"
(dpkg-query -W -f='${Status}' curl 2>/dev/null | grep -c "ok installed")
if [ $? -eq 0 ]; then
    echo "Package $1 is installed!"
else
    echo "Package $1 is NOT installed!"
    echo -n "Do you wish to install curl (y/n)?"
    read answer
    if [ "$answer" != "${answer#[Yy]}" ] ;then 
    echo Yes
    echo "[+] installing curl package to retrieve rust install script"
    apt install curl
    else
    echo No
    fi
fi


#Check if Rust is installed:
echo ""
echo "[+] Checking if Rust is installed"
(dpkg-query -W -f='${Status}' rustup 2>/dev/null | grep -c "ok installed")
if [ $? -eq 0 ]; then
    echo "Package $1 is installed!"
else
    echo "Package $1 is NOT installed!"
    echo -n "Do you wish to install rust (y/n)? "
    read answer
    if [ "$answer" != "${answer#[Yy]}" ] ;then 
    echo Yes
    echo -n "1. In a seperate shell on same host enter 'curl https://sh.rustup.rs -sSf | sh'\n2.Then enter 'source ~/.cargo/env'\nPress any key to continue when done" 
    while [ true ] ; do
    read -t 3 -n 1
    if [ $? = 0 ] ; then
    exit ;
    else
    echo "waiting for the keypress"
    echo No
    fi

fi


#Installing SGX SDK
echo ""
echo "[+] Installing SGX SDK"
echo  -n "1. In a seperate shell on same host enter 'wget https://download.01.org/intel-sgx/sgx-linux/2.15/distro/ubuntu20.04-server/sgx_linux_x64_sdk_2.15.100.3.bin'\nPress any key to continue when done"
while [ true ] ; do
read -t 3 -n 1
if [ $? = 0 ] ; then
exit ;
else
echo "waiting for the keypress"
echo -n "In seperate shell enter'chmod +x sgx_linux_x64_sdk_2.15.100.3.bin'\nPress any key to continue when done"
while [ true ] ; do
read -t 3 -n 1
if [ $? = 0 ] ; then
exit ;
else
echo "waiting for the keypress"
echo -n "In seperate shell enter 'echo -e 'no\n/opt/intel' | sudo ./sgx_linux_x64_sdk_2.15.100.3.bin"
while [ true ] ; do
read -t 3 -n 1
if [ $? = 0 ] ; then
exit ;
else
echo "waiting for the keypress"
yes | rm sgx_linux_x64_sdk_2.15.100.3.bin
echo -n "[+] To configure your current shell with Intel SGX SDK , run in the seperate shell: \nsource /opt/intel/sgxsdk/environment\nhit any key to proceed"
while [ true ] ; do
read -t 3 -n 1
if [ $? = 0 ] ; then
exit ;
else
echo "waiting for the keypress"




#Check if yarn is installed:
echo ""
echo "[+] Checking if Node.js is installed"
(dpkg-query -W yarn 2>/dev/null | grep -c "ok installed")
if [ $? -eq 0 ]; then
    echo "Package $1 is installed!"
else
    echo "Package $1 is NOT installed!"
    echo -n "Do you wish to install nodejs & yarn (y/n)? "
    read answer
    if [ "$answer" != "${answer#[Yy]}" ] ;then 
    echo Yes
    echo "[+] Installation of yarn and Node.js in progress this will take a while..."
    curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash -
    apt-get install -y nodejs
    npm install -g yarn
    else
    echo No
    fi

fi


echo ""
echo "[+] Final checks running..... Se below:"
rustup --version
# rustup 1.22.1 (b01adbbc3 2020-07-08)

cargo --version
# cargo 1.46.0 (149022b1d 2020-07-17)

echo $SGX_SDK
# /opt/intel/sgxsdk

# LLVM-9 or higher versions are fine
clang --version
# clang version 10.0.0-4ubuntu1
# Target: x86_64-pc-linux-gnu
# Thread model: posix
# InstalledDir: /usr/bin

node --version
# v12.16.3

yarn --version
# 2.1.1"



