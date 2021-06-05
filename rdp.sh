curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
apt-get update -y 
sudo apt-get install --no-install-recommends ubuntu-desktop gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal gnome-core -y 
apt install tigervnc-standalone-server -y 
useradd -m user
adduser user sudo 
echo 'user:root' | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
sudo -u user vncpasswd 
su -u user vncserver -localhost no 
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip ngrok-stable-linux-amd64.zip
./ngrok authtoken 1nQmkjYRvHxcSCQIlhrDBtxenYD_3pZ5g3KjUuVHeLaYn9R9G
./ngrok tcp 5901


 
