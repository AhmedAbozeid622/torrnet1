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


# install Jupyter & create config file 
sudo pip install jupyter
jupyter notebook --generate-config
echo "c.NotebookApp.allow_remote_access = True" >>  /root/.jupyter/jupyter_notebook_config.py # Allow remote access (i.e: ngrok , remote.it , ...)
jupyter notebook password # Must enter password


### Ngrok url with python ###
sudo pip install requests
echo "
import requests 
import json

req = requests.get('http://127.0.0.1:4040/api/tunnels')
req = req.json()
print('Ngrok-Url-Is: ', req['tunnels'][0]['public_url'])

" > /root/ngrok.py  

### (start code) ###
echo "jupyter notebook </dev/null &>/dev/null &  ### in the backend
nohup ./ngrok http 8888 &>/dev/null &
clear
python3.6 /root/ngrok.py 
" > /root/start.sh && chmod +x /root/start.sh


### Start tmux for Session for background work ###
sudo apt-get install tmux -y
cd /root && tmux
# Run start.sh in him



