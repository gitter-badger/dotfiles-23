HAS_APT=`which apt-get`

#Install dependencies
if [ $HAS_APT ]; then
	sudo apt-get install -y zsh git-core wget
fi

#Install oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
	sudo wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
fi

#Change shell
chsh -s `which zsh`

#Add config files
rm -rf ~/.zshrc
ln -srf ./config/zshrc ~/.zshrc

#Add powerline fonts
if [ ! -d ~/.fonts/ubuntu-mono-powerline  ]; then
	mkdir -p ~/.fonts
	git clone https://github.com/scotu/ubuntu-mono-powerline.git ~/.fonts/ubuntu-mono-powerline
	fc-cache -vf ~/.fonts/
	mkdir -p ~/tmp
	git clone https://github.com/powerline/fonts.git ~/tmp/fonts
	pushd ~/tmp/fonts
	./install
	popd;
fi
