echo "Tải xuống các tệp windows"
# wget -O w7x64.img https://bit.ly/akuhnetw7X64
echo "Tải ngrok"
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1
read -p "Ctrl + V Authtoken(nhập token ngrok): " CRP 
./ngrok authtoken $CRP 
nohup ./ngrok tcp 3388 &>/dev/null &
echo Tải xuống tệp từ sever
apt-get install qemu
echo "Đợi"
echo "Khởi động Windows"
echo RDP Địa chỉ:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "Ctrl+C để Copy"
echo "Đợi 1-2 Phút để hoàn thành thiết lập"
echo "Không đóng tab này"
echo "hãy ủng hộ Hoàng vtmc xin cảm ơn"
qemu-system-x86_64 -hda w7x64.img -m 8G -smp cores=4 -net user,hostfwd=tcp::3388-:3389 -net nic -object rng-random,id=rng0,filename=/dev/urandom -device virtio-rng-pci,rng=rng0 -vga vmware -nographic
sleep 43200
