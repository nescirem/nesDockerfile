# Version 0.1

# start by building the basic container
FROM fedora:31
MAINTAINER nescirem <nescirem@gmail.com>

# install dependencies
RUN dnf clean all && dnf update -y --releasever=31
RUN dnf install -y glibc-langpack-en
RUN dnf install -y gcc gcc-c++
RUN dnf install -y gcc-gfortran gdb make cmake vim wget
RUN dnf install -y openmpi openmpi-devel
RUN dnf install -y mpich mpich-devel
RUN dnf install -y redhat-rpm-config
RUN dnf clean all

# download cgns3.2.1
WORKDIR /home
RUN wget --no-check-certificate https://github.com/CGNS/CGNS/archive/v3.2.1.tar.gz

# copy local test codes into the docker image
COPY . /home/programing
WORKDIR /home/programing

# if openmpi
##CMD sed '$aexport PATH=/usr/lib64/openmpi/bin:$PATH' ~/.bashrc && source ~/.bashrc
# elseif mpich
RUN sed -i '$aexport PATH=/usr/lib64/mpich/bin:$PATH' ~/.bashrc 
CMD source ~/.bashrc
