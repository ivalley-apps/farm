lsmod | grep br_netfilter
sudo systemctl enable kubelet
sudo kubeadm config images pull

#sudo kubeadm config images pull --cri-socket /var/run/crio/crio.sock

#sudo echo "10.0.2.5 k8s-cluster.ivalley.app" >> /etc/hosts

sudo kubeadm init --pod-network-cidr=192.168.0.0/16 --cri-socket /var/run/crio/crio.sock --upload-certs --control-plane-endpoint=k8s-cluster.ivalley.app


mkdir -p $HOME/.kube
sudo cp -f /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl cluster-info


