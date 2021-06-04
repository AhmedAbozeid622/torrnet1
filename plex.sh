wget https://downloads.plex.tv/plex-media-server/1.14.0.5470-9d51fdfaa/plexmediaserver_1.14.0.5470-9d51fdfaa_amd64.deb

sudo dpkg -i plexmediaserver_1.14.0.5470-9d51fdfaa_amd64.deb
sudo systemctl start plexmediaserver
dpkg -L plexmediaserver
wget -q https://downloads.plex.tv/plex-keys/PlexSign.key -O - | sudo apt-key add -
sudo apt update
clear
echo "Your link:"
echo "http://localhost:32400/web"
