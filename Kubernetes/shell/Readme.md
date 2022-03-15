
# Reset  ( critical , delete iptables too)

  https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm-reset/


  # Error 

  https://discuss.kubernetes.io/t/the-connection-to-the-server-localhost-8080-was-refused-did-you-specify-the-right-host-or-port/1464/40

  mkdir -p $HOME/.kube
$ sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
$ sudo chown $(id -u):$(id -g) $HOME/.kube/config
  export KUBECONFIG=$HOME/.kube/config

  https://discuss.kubernetes.io/t/the-connection-to-the-server-host-6443-was-refused-did-you-specify-the-right-host-or-port/552


    sudo -i
    swapoff -a
    exit
    strace -eopenat kubectl version
