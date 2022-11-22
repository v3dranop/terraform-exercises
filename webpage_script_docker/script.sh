#!/bin/bash

# install and configure docker on the ec2 instance
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo systemctl enable docker

# build the docker image
sudo docker build -t terraformws:latest .

# login to your docker hub account
cat pass.txt | sudo docker login --username vedranop --password --password-stdin

sudo docker image tag terraformws:latest vedranop/terraform:latest

# push the image to your docker hub repository
sudo docker image push vedranop/terraform:latest

# start the container to test the image 
sudo docker run -dp 80:80 vedranop/terraform

