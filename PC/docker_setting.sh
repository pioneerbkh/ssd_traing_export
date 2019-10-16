###### Docker ###### 

sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
apt-cache policy docker-ce

###### 도커 설치 ###### 

sudo apt install docker-ce

# NVIDIA Docker

#레파지토리 추가

curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update

#NVIDIA 도커2 설치
sudo apt-get install -y nvidia-docker2
sudo pkill -SIGHUP dockerd

# Create Container

#sudo nvidia-docker run --name OBJ_DETECT -it -d --net=host \
# -v "/home/nvidia/workplace:/tod_ws" \
# nvcr.io/nvidia/tensorflow:18.08-py3

# Connect to Container
#sudo docker exec -it OBJ_DETECT /bin/bash

# Restart Container
#sudo docker restart OBJ_DETECT

