#!/bin/sh
sudo yum update -y
sudo amazon-linux-extras install docker
sudo service docker start
sudo usermod -a -G docker ec2-user

source ~/.bashrc


## lets pull docker image for proemethusA
docker pull gocd/gocd-server


## now lets run prometheus docker
docker run \
    -p 9090:9090 \
    -v /home/ec2-user/training/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml \
    prom/prometheus



### install and configure grafana
docker run -d -p 3000:3000 grafana/grafana