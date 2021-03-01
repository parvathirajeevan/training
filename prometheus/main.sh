#!/bin/sh
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo usermod -a -G docker ec2-user

#source ~/.bashrc


## lets pull docker image for proemethusA
#docker pull gocd/gocd-server


## now lets run prometheus docker
sudo docker run -d \
    -p 9090:9090 \
    -v /home/ec2-user/training/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml \
    prom/prometheus



### install and configure grafana
sudo docker run -d -p 3000:3000 grafana/grafana


### install node exporter
wget https://github.com/prometheus/node_exporter/releases/download/v1.1.1/node_exporter-1.1.1.linux-amd64.tar.gz
tar xvfz node_exporter-*.*-amd64.tar.gz
cd node_exporter-*.*-amd64
./node_exporter 