FROM debian:jessie
MAINTAINER Josh Cox <josh 'at' webhosting coop>

ENV DOCKER_BIND_UPDATED 20150513

#APT
RUN apt-get -y update
RUN apt-get install -y bind9
RUN rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/start.sh"]
