FROM ubuntu:focal
ARG TAGS
WORKDIR /usr/local/bin
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install -y software-properties-common && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt update && \
    apt install -y curl git ansible
COPY . .
CMD ["sh", "-c", "ansible-playbook --ask-vault-pass --ask-become-pass $TAGS local.yml"]

