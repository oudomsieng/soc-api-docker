FROM centos:centos7
MAINTAINER The CentOS Project <cloud-ops@centos.org>

ENV NODE_ENV production

RUN yum install -y curl
RUN curl --silent --location https://rpm.nodesource.com/setup_4.x | bash -

RUN yum install -y nodejs
RUN yum clean all

RUN mkdir /usr/src/soc-api
WORKDIR /usr/src/soc-api
EXPOSE 8000

CMD [ "npm", "run", "prod" ]