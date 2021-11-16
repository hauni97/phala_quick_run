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