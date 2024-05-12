                                # Notice 

# You need to run this script with root privilages.

#Script tested on ubuntu 22.04 

# updating the packages and upgrading, installing docker, python and docker-compose

apt update -y && apt upgrade -y && apt install docker.io  python3-pip -y && pip install docker-compose
##Installation of Selfhostedpro yacht

docker volume create yacht
docker run -d -p 8000:8000 -v /var/run/docker.sock:/var/run/docker.sock -v yacht:/config --name yacht --restart unless-stopped selfhostedpro/yacht

###installation of cloudpanel

curl -sS https://installer.cloudpanel.io/ce/v2/install.sh -o install.sh; \
echo "85762db0edc00ce19a2cd5496d1627903e6198ad850bbbdefb2ceaa46bd20cbd install.sh" | \
sha256sum -c && sudo DB_ENGINE=MARIADB_10.11 bash install.sh