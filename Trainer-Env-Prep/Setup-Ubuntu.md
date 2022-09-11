# Trainer Tasks

```
sudo apt -y update
sudo apt -y install tree git openssl software-properties-common curl wget
```

## Setup multiple users in Ubuntu
- For each participant, we need to setup login accounts
```
sudo groupadd docker
for ((i=1;i<=50;i++)); do
	export username="u$i"
	sudo useradd -m -p "p2" $username;sudo usermod -aG sudo $username;sudo usermod -aG docker $username;echo $username:p | sudo /usr/sbin/chpasswd;sudo chown -R  $username:root /home/$username
done
```

-  Clone Git Repo
```
cd
git clone
cd
```

- Customize linux prompt
```
cat ~/.bashrc
echo 'export PS1="\e[0;31m\e[50m\u@\h\n\w \e[m\n$ "'   >> ~/.bashrc
cat ~/.bashrc
exit
```

### Setup Python
```
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt install -y python3.10
python3.10 --version
sudo apt install -y python3-pip
sudo apt install -y python3-venv
mkdir python_venv
cd python_venv/
python3 -m venv .
source  bin/activate
python -V
deactivate
cd ~
```


## Install Docker
```
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
```

```
sudo usermod -aG docker $USER
exit
```
