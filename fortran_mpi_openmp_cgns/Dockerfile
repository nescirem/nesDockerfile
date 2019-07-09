# Version 0.1

# start by building the basic container
FROM fedora:31
MAINTAINER nescirem <nescirem@gmail.com>

# yum mirror for mainland China user
WORKDIR /etc/yum.repos.d
RUN mv fedora.repo fedora.repo.bak
RUN mv fedora-updates.repo fedora-updates.repo.bak
RUN curl -k https://nesic.site/ftp/Linux/sources/fedora.repo > fedora.repo
RUN curl -k https://nesic.site/ftp/Linux/sources/fedora-updates.repo > fedora-updates.repo


# install dependencies
RUN dnf clean all && dnf update -y --releasever=31
RUN dnf install -y glibc-langpack-en
RUN dnf install -y gcc gcc-c++
RUN dnf install -y gcc-gfortran gdb make cmake vim wget
RUN dnf install -y openmpi openmpi-devel
RUN dnf install -y mpich mpich-devel
RUN dnf install -y cgnslib cgnslib-devel
RUN dnf clean all

# copy local test codes into the docker image
COPY . /home/programing
WORKDIR /home/programing

# if openmpi
# CMD export PATH=/usr/lib64/openmpi/bin/:${PATH}
# elseif mpich
CMD export PATH=/usr/lib64/mpich/bin/:${PATH}
