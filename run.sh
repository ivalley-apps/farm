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

simpleCluster()
{
    echo "simple cluster creation"

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
