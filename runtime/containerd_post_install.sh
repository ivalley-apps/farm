sudo groupadd docker
sudo usermod -aG docker $USER
# logout 

newgrp docker 
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R

 sudo systemctl enable docker.service
 sudo systemctl enable containerd.service