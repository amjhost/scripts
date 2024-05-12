                                # Notice 

# You need to run this script with root privilages.

#Script tested on ubuntu 22.04 
echo "##########################           Script tested on ubuntu 22.04#                ################################### "


# updating the packages and upgrading, installing docker, python and docker-compose
echo "####################       Updating the packages and upgrading, installing docker, python and docker-compose         #########################"

apt update -y && apt upgrade -y && apt install docker.io  python3-pip -y && pip install docker-compose
##Installation of Selfhostedpro yacht

echo"#################         Installation of Selfhostedpro yacht            ##########################"

docker volume create yacht
docker run -d -p 8000:8000 -v /var/run/docker.sock:/var/run/docker.sock -v yacht:/config --name yacht --restart unless-stopped selfhostedpro/yacht

##installation of portainer

docker volume create portainer_data
docker run -d -p 8001:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
## automatic Installation of code-server
echo "Automatic Installation of code-server"

curl -fsSL https://code-server.dev/install.sh | sh

sudo systemctl enable --now code-server@$USER

echo "Waiting for 10 seconds..."
sleep 10


rm -rf /root/.config/code-server/config.yaml

touch /root/.config/code-server/config.yaml

printf "bind-addr: 0.0.0.0:8080\nauth: password\npassword: Amjadali@2021\ncert: false\n" > /root/.config/code-server/config.yaml

systemctl restart code-server@root.service 



# Installation of cloud panel

echo "Installation of cloudpanel....."

curl -sS https://installer.cloudpanel.io/ce/v2/install.sh -o install.sh; \
echo "85762db0edc00ce19a2cd5496d1627903e6198ad850bbbdefb2ceaa46bd20cbd install.sh" | \
sha256sum -c && sudo DB_ENGINE=MARIADB_10.11 bash install.sh