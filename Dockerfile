FROM centos:centos7
MAINTAINER The CentOS Project <cloud-ops@centos.org>

ENV NODE_ENV production

RUN yum install -y epel-release

RUN yum install -y git
RUN mkdir /root/.ssh/
ADD id_rsa /root/.ssh/id_rsa
RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts

RUN yum install -y nodejs
RUN yum install -y npm
RUN yum clean all

WORKDIR /usr/src
RUN git clone git@bitbucket.org:soc-gen/soc-api.git

WORKDIR /usr/src/soc-api
RUN npm install
EXPOSE 8000

CMD [ "npm", "run", "prod" ]