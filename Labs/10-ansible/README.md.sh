# Installation:
sudo apt -y install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible

# ssh-keygen
ssh-keygen -f ~/.ssh/demo_id_rsa -N ''
chmod 0600 ~/.ssh/demo_id_rsa

# Update Hosts:
 # - ~/devops-sep-22/Labs/10-ansible/hosts

# Validate and obtain information about your Ansible inventory
ansible-inventory -i hosts --list

# Deploy Public Key to host
ssh-copy-id -i ~/.ssh/demo_id_rsa.pub demouser@20.12.75.214
ssh-copy-id -i ~/.ssh/demo_id_rsa.pub demouser@20.12.52.45

# Test the key
ssh -i ~/.ssh/demo_id_rsa demouser@20.12.75.214
exit
ssh -i ~/.ssh/demo_id_rsa demouser@20.12.52.45
exit

# Test Ansible is able to conenct to all hosts
ansible all -i hosts -m ping

# Running ad hoc commands
ansible all -i hosts -a uptime
ansible all -i hosts -a "free -m"
ansible all -i hosts -a "df -h"

# Running Playbook
ansible-playbook -i hosts first_playbook.yml

# Confirm content of the file in all hosts
ansible all -i hosts -a "cat /tmp/testfile.txt"
