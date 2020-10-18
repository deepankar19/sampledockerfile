# install ubuntu image
FROM ubuntu:latest

# update and upgrade ubuntu 
RUN apt-get update && apt-get install -y

# stuff that neede to updated 
RUN apt-get install -y \
             wget \
	     apt-transport-https \
             ca-certificates \
             curl \
             gnupg-agent \
             software-properties-common

#adding docker official GPG key
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#create repository
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# update and install docker 
RUN apt-get update \
    && apt-get install docker-ce docker-ce-cli containerd.io -y

# start and enable the docker 
RUN systemctl start docker \
    && systemctl enable docker

