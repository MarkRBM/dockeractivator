#we are going to use ansible for as much provisioning as possible so use ansible ubuntu base image
FROM ansible/ubuntu14.04-ansible
MAINTAINER Mark Moore

# Set locales
RUN locale-gen en_GB.UTF-8
ENV LANG en_GB.UTF-8
ENV LC_CTYPE en_GB.UTF-8

#fix sh
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

#Add playbooks to the docker image
ADD ansible /srv/ansible/
WORKDIR /srv/ansible

#run ansible to configure the docker image
RUN ansible-playbook base.yml -c local
