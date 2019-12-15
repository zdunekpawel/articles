#!/bin/bash
#this script in bash is a part of guide on VM's networks
#the article doesn't exist yet :(  :( )

echo "script adding Oracle linux instance to my VBox from .iso image"
echo """
	prerequisities:
		-vBoxManage tool 
		-iso file 
		-trust in this script 
	"""
#path for iso file: 
linux_img="/Users/pzdunek/Downloads/OracleLinux-R7-U0-Server-x86_64-dvd.iso" 
#path for vdi location 
path="/Users/pzdunek/VirtualBox VMs/Oracle DB Developer VM/"

#if [ 1 -eq 0 ]; then

#do you trust this script? :) 
while true; do
	read -p "do you want to continue (y/n)? " answer
	case ${answer:0:1} in
    	y|Y )
        	echo " ok :) "
			break
    	;;
    	n|N )
        	echo "ok, bye :)" 
		exit
    	;;
	* ) 
		echo "please answer yes or no"
		;;
	esac
 done

#check if orc l is supported
sol=$(vboxmanage list ostypes | grep "Oracle_64")
if [ ${#sol} -eq 0 ]; then
	echo "Oracle 64 not supported in your VBox :( "
	exit
fi

# creating new VM 
echo "creating new VM instance"
while true; do
	read -p "provide instance name " instance_name 
	#this method will fail if new instance name will be a substring of already existing instance :) 
	check=$(vboxmanage list vms | grep "$instance_name")
	if [ -z "$instance_name" ]; then 
		echo "instance name can't be empty"
	elif [ ${#check} -ne 0 ]; then
        	echo "name taken, choose different one"
	else 
		out=$(vboxmanage createvm --name $instance_name --ostype Oracle_64 --register)
		echo $out
			# some naive err. handling :( 
		if [[ $out != *"created and registered"* ]]; then
			echo "error when creating instance, exiting"
			echo $out
			exit
		fi
		break
	fi
done

#config instance
echo "setting 2cpus and 2048ram and 120vram for VM"
vBoxManage modifyvm $instance_name --cpus 2 --memory 4096 --vram 128
vBoxManage setextradata $instance_name CustomVideoMode1 800x600x32
#network interface 

read -p "provide network interface name pls [awdl0] "  interface_name
interface_name=awdl0
VBoxManage modifyvm $instance_name --nic1 bridged --bridgeadapter1 $interface_name


#creating virtual media 
echo "creating virtual media"
while true; do
	read -p "provide .vdi name, no whitespaces allowed " vdi
	duplicate=$(find "$path" -name $vdi".vdi")
	if [[ ${#duplicate} -ne 0 ]]; then
		echo "there is already a file of this name in current dir."
	else
		break
	fi
done

vdi_path="$path"'/'$vdi'.vdi'
echo "choose size of hd for your vm " 
while true; do
	read -p "[5120] " hd_size 
	if [[ -z $hd_size ]]; then
		hd_size=5120
		break
	elif [[ $hd_size -le 0 ]]; then
		echo "hd_size can't be negative"
	elif [[ $hd_size -gt 45120 ]]; then
		echo "max hd size is 45120"
	elif [[ -n ${hd_size//[0-9]/} ]]; then
		echo "size can't contain letters!"
	else 
		break 
	fi
done

echo "creating hd.."
VBoxManage createhd --filename "$vdi_path" --size $hd_size --variant Standard 

#add storage controller
echo "creating SATA controller.. "
vboxmanage storagectl $instance_name --name "SATA Controller" --add sata --bootable on # poszło 

#attach storage
echo "attaching SATA.."
vboxmanage storageattach $instance_name --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "$vdi_path" # poszło

#add ide controller
echo "creating IDE controller"
VBoxManage storagectl $instance_name --name "IDE Controller" --add ide # poszlo 

#attach ide 
echo "attaching iso file.."
vboxmanage storageattach $instance_name --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium $linux_img 

echo "done - proceed with os installation manually :( "

#wait some time here
#sleep 30s
#vboxmanage controlvm $instance_name keyboardputstring "foo"

#fi

	# create instance
	#vboxmanage createvm --name $instance_name --ostype Solaris_11 --register

	# show instance default configs
	#VBoxManage showvminfo $instance_name
	
	# change some configs:
	#VBoxManage modifyvm $instance_name --cpus 2 --memory 2048 --vram 12

	# network 
	#VBoxManage modifyvm $instance_name --nic1 bridged --bridgeadapter1 awdl0

# attaching virtual media

	#creating
#	vdi_path="/Users/pzdunek/VirtualBox VMs/Oracle DB Developer VM/$instance_name.vdi"
#	$VBoxManage createhd --filename "$vdi_path" --size 5120 --variant Standard 
	# vboxmanage modifyhd  disk "$vdi_path" --resize 10240

	#add storage controller
#	$vboxmanage storagectl $instance_name --name "SATA Controller" --add sata --bootable on

	#attach 
#	$vboxmanage storageattach $instance_name --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "$vdi_path"

#$installing guest os 
#	#adding IDE controller  for cs/dvd drive 
#	$VBoxManage storagectl $instance_name --name "IDE Controller" --add ide

#	ova_file="~/Downloads/Solaris10_1-13_VM.ova" 
