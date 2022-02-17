#!/bin/bash
#-type simple 
#-child=2 
#-master-ip-1=<<ipaddress>> 
#-node-ip-1=<<ipaddress>> 
#-node-ip-2=<<ipaddress>> 
#-master-user-1=<<username>> 
#-master-password-1=<<password>> 
#-node-user-1=<<user>> 
#-node-user-2=<<user>> 
#-node-password-1=<<password>> 
#-node-password-2=<<password>> 


type_simple=simple
type_ha=ha


helpFunction()
{
   echo ""
   echo "Usage: $0 -t type "
   echo -e "\t-t simple |  ha"
   exit 1 # Exit script after printing help
}




setupTerraform()
{
    sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    sudo apt-get update && sudo apt-get install terraform
}

setupContainerd()
{
cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

# Setup required sysctl params, these persist across reboots.
cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

# Apply sysctl params without reboot
sudo sysctl --system

sudo mkdir -p /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml


}



simpleCluster()
{
    echo "simple cluster creation"
    #install required dependencies
    checkAllSystemConnectionsAreOk()
    setupTerraform()
    pushd kubernetics/simple 
    #Setup a cluser in master node
    #login to child
    # add the child with master nodes
    popd
    pushd security 
    # Add certificate manager with HELM --
    popd 

    kubectl get nodes 
}


haCluster()
{
    echo "simple cluster creation"

}



while getopts "t:" opt
do
   case "$opt" in
      t ) parameterA="$OPTARG" ;;
      ? ) helpFunction ;; 
   esac
done

if [ -z "$parameterA" ] 
then
   echo "Some or all of the parameters are empty"
   helpFunction
elif [ $parameterA == $type_simple ]  
then 
   simpleCluster  
elif [ $parameterA == $type_ha ]  
then  
    haCluster  
else
    echo "invalid action"  
    helpFunction   
fi
