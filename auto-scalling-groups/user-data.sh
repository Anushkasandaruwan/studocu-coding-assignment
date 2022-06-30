#! /bin/bash
sudo yum update -y
sudo yum -y install docker
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo chmod 666 /var/run/docker.sock
docker version
privateip=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)
echo $privateip
sudo yum -y install git
git clone https://github.com/Anushkasandaruwan/nginx-hello.git
cd nginx-hello
docker build -t studoc .
docker run --rm -itd --name studoc -p 80:80 -e private_ip=$privateip -e request_id='$request_id' studoc

