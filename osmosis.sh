apt-get update
pip install playwright
sudo apt-get install libbrotli1\
          libnotify4\
          libwoff1\
          gstreamer1.0-plugins-base\
          libgstreamer1.0-0\
          libgstreamer-gl1.0-0\
          gstreamer1.0-plugins-bad\
          libenchant1c2a\
          libsecret-1-0\
          libhyphen0 -y
sudo apt-get install libdbus-glib-1-2
python3 -m playwright install
wget -q -nc https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.tgz
tar zxf cloudflared-stable-linux-amd64.tgz &> /dev/null
curl -fsSL https://code-server.dev/install.sh | sh &> /dev/null
curl https://rclone.org/install.sh | sudo bash
sudo apt-get update
sudo apt-get install deb-multimedia-keyring
sudo apt-get update
sudo apt-get install ffmpeg



echo '# @title VSCode

# Imports
import os
import requests
import re
import shlex
import time
import signal

from subprocess import Popen, PIPE, call

# @markdown This code cell runs [code-server](https://github.com/cdr/code-server) with agro tunnel.

# @markdown Password (Can be None)
Password = "root"  # @param {type: 'string'}

# @markdown Sleep
Sleep = False  # @param {type: 'boolean'}

# @markdown Run this cell to start vscode

class ColabCode:
    def __init__(
            self,
            port=10000,
            password='',
            verbose=False,
            sleep=False):

        self.install_server(verbose)
        self.start_code(port=port, password=password, verbose=verbose)

        if sleep:
            time.sleep(43200)

    @staticmethod
    def __get_agro():
        hostname = None
        output = requests.get("http://localhost:45678/metrics").text
        result = re.search('cloudflared_tunnel_user_hostnames_counts{userHostname="https://(.+?)"}', output)
        if result is None:
            raise Exception("Cannot get any result from cloudflared metrics")
        hostname = result.group(1)
        if hostname is None:
            raise Exception("Cannot get the hostname from cloudflared, it looks like the connection has failed.")
        return hostname

    def install_server(self, verbose=False):
        os.system("kill -9 $(ps aux | grep 'cloudflared' | awk '{print $2}')")

        if not os.path.isfile("cloudflared"):
            pass
            
        else:
            if verbose:
                print("DEBUG: Skipping installation")
        
        if not os.path.isdir("/root/.local/share/code-server/"):
            settings_path = '/root/.local/share/code-server/User'
            pass
            if not os.path.exists(settings_path):
                os.makedirs(settings_path)
            with open(f'{settings_path}/settings.json', 'w') as settings:
                settings.write("""{
    "extensions.autoUpdate": false,
    "extensions.autoCheckUpdates": false
}""")

    def start_code(self, port=10000, password=None, verbose=False):
        if password:
            code_cmd = f'PASSWORD={password} code-server --port {port} --disable-telemetry'
        else:
            code_cmd = f'code-server --port {port} --auth none --disable-telemetry'

        agro_cmd = f'./cloudflared tunnel --url http://127.0.0.1:10000 --metrics localhost:45678'

        code_proc = Popen([code_cmd], shell=True, stdout=PIPE)
        agro_proc = Popen(shlex.split(agro_cmd), stdout=PIPE)

        if verbose:
            print(f"DEBUG: Code Server process: {code_proc.pid}")
            print(f"DEBUG: Cloudflared process: {agro_proc.pid}")

        time.sleep(3)
        try:
            info = self.__get_agro()
            print('VSCode Server is ready, Visit https://{}/{}'.format(
                info, 
                f'?folder={path}' if path else ''))
        except NameError:
            info = self.__get_agro()
            print(f'VSCode Server is ready, Visit https://{info}')
        except Exception:
            os.kill(code_proc.pid, signal.SIGKILL)
            os.kill(agro_proc.pid, signal.SIGKILL)
            print(f"FAILED: Killing Server... Retry again ...")
            sleep = False


if __name__ == "__main__":
    ColabCode(password=Password, sleep=Sleep)' > 1.py && chmod +x 1.py
    
python3 1.py
python3 1.py
