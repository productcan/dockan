FROM centos:6
MAINTAINER Takamasa Kan
RUN apt-get update && apt-get install -y sudo git
ARG username="kan"
ARG password="can"
RUN mkdir /home/$username
RUN useradd -s /bin/bash -d /home/$username $username && echo "$username:$password" | chpasswd
RUN chown -R $username:$username /home/$username
RUN apt-get install -y make gcc g++ vim tig dbus bash-completion supervisor bzip2 unzip tree sed pandoc locales dialog chrony openssl curl wget expect cron dnsutils procps siege htop inetutils-traceroute iftop bmon iptraf nload slurm sl toilet lolcat lsb-release
RUN locale-gen ja_JP.UTF-8 && localedef -f UTF-8 -i ja_JP ja_JP
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:jp
ENV LC_ALL ja_JP.UTF-8
WORKDIR /var/www/html