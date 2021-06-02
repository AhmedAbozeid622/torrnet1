apt-get update -y
add-apt-repository ppa:qbittorrent-team/qbittorrent-stable -y
apt install qbittorrent-nox -y
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip ngrok-stable-linux-amd64.zip
./ngrok authtoken 1nQmkjYRvHxcSCQIlhrDBtxenYD_3pZ5g3KjUuVHeLaYn9R9G
qbittorrent-nox --webui-port=8080
