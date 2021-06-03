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


### (Optional) ###
# jupyter notebook </dev/null &>/dev/null &  ### in the backend
# nohup ./ngrok http 8888 &>/dev/null &


