apt-get update -y 
apt-get install sudo -y
sudo apt-get install software-properties-common -y 
sudo add-apt-repository ppa:deadsnakes/ppa -y 
sudo apt-get update
sudo apt-get install python3.6 -y 
cd /usr/lib/python3.6 && wget https://bootstrap.pypa.io/get-pip.py && python3.6 get-pip.py
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip ngrok-stable-linux-amd64.zip
./ngrok authtoken 1nQmkjYRvHxcSCQIlhrDBtxenYD_3pZ5g3KjUuVHeLaYn9R9G
