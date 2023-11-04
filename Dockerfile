FROM amazonlinux:latest

RUN yum install -y python3 python3-pip openssh-clients sudo && \
    pip3 install ansible

COPY . /ansible

WORKDIR /ansible