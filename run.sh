#!/usr/bin/env bash
#apt update
#apt upgrade -y

echo
echo "################################"
echo "# Installing packages with APT #"
echo "################################"
echo

xargs -a package_lists/apt_package_list apt install -y

echo
echo "################################"
echo "# Installing packages with PIP #"
echo "################################"
echo

sudo pip3 install --upgrade pip
xargs -a package_lists/pip_package_list sudo pip3 install

mkdir -p temp

echo
echo "############################"
echo "# Installing Google Chrome #"
echo "############################"
echo

if [ ! -f "temp/google-chrome-stable_current_amd64.deb" ]; then
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O temp/google-chrome-stable_current_amd64.deb
fi

dpkg -i temp/google-chrome-stable_current_amd64.deb

# wget https://packagecontrol.io/Package%20Control.sublime-package -O ~/.config/sublime-text-3/Installed\ Packages/Package\ Control.sublime-package

echo
echo "######################"
echo "# Installing Cerebro #"
echo "######################"
echo

if [ ! -f "temp/cerebro_0.3.2_amd64.deb" ]; then
    wget https://github.com/KELiON/cerebro/releases/download/v0.3.2/cerebro_0.3.2_amd64.deb -O temp/cerebro_0.3.2_amd64.deb
fi
dpkg -i temp/cerebro_0.3.2_amd64.deb

echo
echo "###################"
echo "# Installing Peek #"
echo "###################"
echo

sudo add-apt-repository --yes ppa:peek-developers/stable
sudo apt update
sudo apt install -y peek

echo
echo "########################"
echo "# Installing Flameshot #"
echo "########################"
echo

cd temp
git clone https://github.com/lupoDharkael/flameshot
cd flameshot
sudo apt install -y libqt5dbus5, libqt5network5, libqt5core5a, libqt5widgets5, libqt5gui5
sudo apt install -y git g++ build-essential qt5-qmake qt5-default qttools5-dev-tools
qmake && make
make install

echo
echo "########################"
echo "# Installing Oh-My-ZSH #"
echo "########################"
echo

sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
