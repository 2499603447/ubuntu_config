
if [ $# != 1 ]
then
	echo "		***********Parameters Error***********"
	echo "		**Usage:./sublime_install.sh version**"
	echo "		**eg:./sublime_install.sh stable******"
	echo "		**************************************"
	exit 1;
fi

echo "	********Installing the GPG key********"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

echo "	********Ensure apt is set up to work with https sources********"
sudo apt-get install apt-transport-https

#Select the channel to use:
#Stable
if [ $1 = "stable" ]
then
	echo "	********Current version is stable********"
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
elif [ $1 = "dev" ]
then
#Dev
	echo "	********Current version is dev********"
	echo "deb https://download.sublimetext.com/ apt/dev/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

fi

echo "	********Update apt sources and install Sublime Text********"
sudo apt-get update
sudo apt-get install sublime-text