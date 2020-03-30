FROM ubuntu:16.04
LABEL maintainer="TosO <tosokr@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive
RUN dpkg --add-architecture i386 && \ 
    apt update && \ 
    apt install -y \
        mailutils \
        postfix \
        curl \
        wget \
        file \
        tar \
        bzip2 \
        gzip \
        unzip \
        bsdmainutils \
        python \
        util-linux \
        ca-certificates \
        binutils \
        bc \
        jq \
        tmux \
        lib32gcc1 \
        libstdc++6 \
        lib32stdc++6 \
        netcat \
        steamcmd

RUN useradd -ms /bin/bash csgoserver

USER csgoserver
WORKDIR /home/csgoserver

RUN wget -O linuxgsm.sh https://linuxgsm.sh && \
    chmod +x linuxgsm.sh && \
    bash linuxgsm.sh csgoserver

RUN ./csgoserver auto-install
ENTRYPOINT ["bash","./csgoserver start"]
EXPOSE 27015/udp 27020/udp