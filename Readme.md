## Prerequsites
   
    1. All servers are up with ubundu server : https://releases.ubuntu.com/20.04/


    2. Install  Git, Open ssh and net tools

       sudo apt update
       sudo apt install git openssh-server net-tools
       sudo ufw allow ssh  

## For Simple cluster creation

#./run.sh --type simple --child=2 --master-ip-1=<<ipaddress>> --node-ip-1=<<ipaddress>> --node-ip-2=<<ipaddress>> --master-user-1=<<username>> --master-password-1=<<password>> --node-user-1=<<user>> --node-user-2=<<user>> --node-password-1=<<password>> --node-password-2=<<password>> 