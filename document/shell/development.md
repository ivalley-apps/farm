## Prerequsites
   
    1. All servers are up with ubundu server : https://releases.ubuntu.com/20.04/


    2. Install  Git, Open ssh and net tools

       sudo apt update
       sudo apt install git openssh-server net-tools sshpass
       sudo ufw allow ssh  

# Introduction 

      For development and testing purpose used virualbox and ubundu. 

# Reference url 

   http://download.virtualbox.org/virtualbox/6.1.32/

# Required  

   Oracle_VM_VirtualBox_Extension_Pack-6.1.32.vbox-extpack 
   

# Installing ubunud and required deps for development for accssing shared files 

  sudo apt install virtualbox-guest-utils
  sudo adduser <<login_user>>  vboxsf


# mac 
   
    brew install coreutils --> sha256sum