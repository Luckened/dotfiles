HOME_USR=luckened

init:
	sudo apt-get update && sudo apt-get upgrade
	sudo apt-get install -y curl htop git snapd wget xclip zsh
	git config --global user.name "Lucca Miranda"
	git config --global user.email "luccafmsilva@gmail.com"

github-config:
	ssh-keygen -t rsa -b 4096 -C "luccafmsilva@gmail.com"
	eval "$$(ssh-agent -s)"
	ssh-add ~/.ssh/id_rsa
	xclip -sel clip < ~/.ssh/id_rsa.pub
	echo "copiou a key ssh!"

install-node:
	curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
	sudo apt-get install -y nodejs

install-yarn:
	curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
	sudo apt install yarn

install-vscode:
	sudo snap install --classic code

install-spotify:
	sudo snap install spotify

install-zsh:
	sh -c "$$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	sudo scp .zshrc ~
	sudo scp -r lib dracula.zsh-theme /home/${HOME_USR}/.oh-my-zsh/themes/
	. ~/.zshrc

install: \
	init \
	install-node \
	install-yarn \
	install-vscode \
	install-spotify \
	github-config
