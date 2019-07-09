# Version 0.1

# start by building the basic container
FROM centos:6
MAINTAINER nescirem <nescirem@gmail.com>

# yum mirror for mainland China user
WORKDIR /etc/yum.repos.d
RUN mv CentOS-Base.repo CentOS-Base.repo.bak
RUN curl https://nesic.site/ftp/Linux/sources/CentOS-Base.repo >CentOS-Base.repo

# resolve GPG key warning
WORKDIR /etc/pki/rpm-gpg
RUN curl http://mirrors.163.com/centos/RPM-GPG-KEY-CentOS-7 > RPM-GPG-KEY-CentOS-7
RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

# install dependencies
RUN yum makecache && yum update -y
RUN yum install -y gcc gcc-c++
RUN yum install -y compat-gcc-44
RUN yum install -y compat-gcc-44-c++ compat-gcc-44-gfortran
RUN yum install -y compat-libf2c-34
RUN yum install -y gcc-gfortran gdb make cmake vim
RUN yum install -y openmpi openmpi-devel
RUN yum install -y mpich mpich-devel
RUN yum clean all

# copy local test codes into the docker image
COPY . /home/programing
WORKDIR /home/programing

# if openmpi
# CMD export PATH=/usr/lib64/openmpi/bin/:${PATH} && module load mpi/openmpi-x86_64
# elseif mpich
CMD export PATH=/usr/lib64/mpich/bin/:${PATH} && module load mpi/mpich-x86_64
