#!/bin/bash

# Check if script is being run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Notice
echo "Notice: You need to run this script with root privileges."
echo "Script tested on Ubuntu 22.04."

# Updating packages, upgrading, and installing necessary packages
apt update -y && apt upgrade -y && apt install docker.io python3-pip -y && pip install docker-compose

# Installation of Selfhostedpro Yacht
docker volume create yacht
docker run -d -p 8000:8000 -v /var/run/docker.sock:/var/run/docker.sock -v yacht:/config --name yacht --restart unless-stopped selfhostedpro/yacht

# Installation of Portainer
docker volume create portainer_data
docker run -d -p 8001:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

# Automatic Installation of code-server
curl -fsSL https://code-server.dev/install.sh | sh

# Setting up config.yaml for code-server
mkdir -p ~/.config/code-server
cat > ~/.config/code-server/config.yaml <<EOF
bind-addr: 0.0.0.0:8080
auth: password
password: Amjadali@2021
cert: false
EOF

# Installation of CloudPanel
curl -sS https://installer.cloudpanel.io/ce/v2/install.sh -o install.sh
echo "85762db0edc00ce19a2cd5496d1627903e6198ad850bbbdefb2ceaa46bd20cbd  install.sh" | sha256sum -c && DB_ENGINE=MARIADB_10.11 bash install.sh
