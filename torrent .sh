wget https://golang.org/dl/go1.15.8.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.15.8.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
go get -v github.com/jpillora/cloud-torrent
docker run -d -p 3000:3000 -v /path/to/my/downloads:/downloads jpillora/cloud-torrent
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip ngrok-stable-linux-amd64.zip
./ngrok authtoken 1oXHtzXSonXVjMNm0Zck3RZeCjp_4CWQjtkFRqoz1Q7Gtrgz6
./ngrok http 3000
