FROM debian:jessie
MAINTAINER Josh Cox <josh 'at' webhosting coop>

#APT
RUN apt-get -y update
RUN apt-get install -y bind9
RUN rm -rf /var/lib/apt/lists/*

ENV DOCKER_BIND_UPDATED 20150513

ADD ./start.sh /start.sh
RUN chmod 755 /start.sh

RUN useradd -m -s /bin/bash steam
RUN usermod -a -G video,audio steam
RUN mkdir -p /home/steam/steamcmd
RUN chown -R steam. /home/steam
USER steam
WORKDIR /home/steam/steamcmd
RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
RUN tar zxvf steamcmd_linux.tar.gz

ENTRYPOINT ["/start.sh"]
