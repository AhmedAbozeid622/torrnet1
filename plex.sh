wget https://downloads.plex.tv/plex-media-server-new/1.19.3.2852-219a9974e/
debian/plexmediaserver_1.19.3.2852-219a9974e_amd64.deb

sudo dpkg –i plexmediaserver_1.19.3..2852-219a9974e_amd64.deb
sudo systemctl enable plexmediaserver.service
sudo systemctl start plexmediaserver.service
echo "Your link:"
echo "http://localhost:32400/web"
