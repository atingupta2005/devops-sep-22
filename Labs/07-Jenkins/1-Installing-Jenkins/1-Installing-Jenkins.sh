## Enable swap space
sudo swapon -s
sudo fallocate -l 8G /swapfile
chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo su
echo "/swapfile   none    swap    sw    0   0" >> /etc/fstab
echo "vm.swappiness=10" >> /etc/sysctl.conf
exit
sudo swapon -s
free -m
sudo sysctl -p

## Removing Jenkins
sudo service jenkins stop
sudo apt-get remove --purge jenkins
sudo apt-get remove jenkins
sudo apt-get remove --auto-remove jenkins
sudo apt remove  -y jenkins
sudo snap remove jenkins

# Install Jenkins
sudo apt-get update
java --version
sudo apt install -y openjdk-11-jdk
java --version
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update -y
sudo apt-get install -y jenkins
sudo systemctl status jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins
docker kill $(docker ps -q)
sudo usermod -aG docker jenkins
sudo chmod 666 /var/run/docker.sock
## - Open jenkins on browser:
###  - http://<server-dns>:8080

sudo cat /var/lib/jenkins/secrets/initialAdminPassword

## Windows
### - Download from
####  - https://www.jenkins.io/download/#downloading-jenkins

## Installing Python
ls /usr/bin/python*
python3 -V
#sudo apt install python3
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1
sudo update-alternatives --config python
