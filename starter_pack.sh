protonvpn_(){ 
	rm -rf protonvpn-stable-release_1.0.1-1_all.de*
	wget protonvpn.deb https://protonvpn.com/download/protonvpn-stable-release_1.0.1-1_all.deb
	sudo apt install ./protonvpn-stable-release_1.0.1-1_all.deb
	rm -rf protonvpn-stable-release_1.0.1-1_all.de*
	sudo apt-get update -y
	sudo apt-get install protonvpn -y

	} 

help(){
                echo "Usage: ${0} {ubuntu|fedora|opensuse}"

	}
ubuntu(){
	sudo apt-get update
	clear
	## chrome, spotify, discord
	pac1(){
		rm -rf ./google-chrome-stable_current_amd64.de*
		wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
		sudo apt install ./google-chrome-stable_current_amd64.deb -y
		rm -rf ./google-chrome-stable_current_amd64.de*
		sudo snap install spotify 
		sudo snap install discord 


	}
	## vscode, vim, pip3, eclipse, postman
	pac2(){	

		sudo snap install code --classic
		sudo apt install vim -y
		sudo apt-get -y install python3-pip
		sudo snap install eclipse --classic
		sudo snap install postman
		sudo apt install hexchat -y

	}
	#protonvpn
	pac3(){
	
		if [ "$(dig +short www.protonvpn.com)" == "127.0.0.1" ]
		then
			if [ "$(cat /etc/hosts | grep "104.26.9.21" | wc -m )" == 0 ]
			then
				sudo sh -c 'printf "\n# Protonvpn dns lookup\n104.26.9.21 repo.protonvpn.com \n185.159.159.140 protonvpn.com" >> /etc/hosts'
				protonvpn_
						
			fi
		else
			protonvpn_
		fi
		
	}
	#custom settings
	pac4(){
		echo "noting to do"
	}

	echo "1) chrome, spotify, discord"
	echo "2) vscode, vim, pip3, eclipse, postman, hexchat"
	echo "3) protonvpn"
	echo "4) custom settings"
	echo "5) all"
	echo "6) exit"
	echo "----------------------------"
	read -p "??: " ver
	
	case $ver in 
		1) pac1;;
		2) pac2;;
		3) pac3;;
		4) pac4;;
		5) pac1 pac2 pac3 pac4;;
		6) exit;
	esac
	echo "-------------------------"
	echo "İnstallation is Completed"
}
#Distro Selection
case ${1} in 
	"ubuntu") ubuntu;;
	"fedora") echo "${1} coming soon";;
	"opensuse") echo "${1} coming soon";;
	-h|--help) help;;
	*)
	       	echo "Usage: ${0} {ubuntu|fedora|opensuse}"
	
esac


	
