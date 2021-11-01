# Quick Installation to Run a Local Development Network
A script to automate the installation process to run a phala node quickly. It eases the process, as elaborated in the tutorial [here](https://wiki.phala.network/en-us/docs/developer/run-a-local-development-network/).

To get the shell script type:

```wget https://raw.githubusercontent.com/hauni97/phala_quick_run/main/phala_quick_install.sh```

To make it executable type:

```chmod +x phala_quick_install.sh```

Now execute it by typing:

```sudo ./phala_quick_install.sh```

_Known bug: Script currently always concludes node.js & yarn + rust is not installed even if it is._
