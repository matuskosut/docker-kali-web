from kalilinux/kali-linux-docker

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get upgrade -yqq && \
    apt-get install host \
                    whois \
                    nmap \
                    telnet \
                    conntrack \
                    iftop \
                    httpie \
                    man \
                    lynx \
                    python3-venv \
                    libxml2 \
                    libxml2-dev \
                    libz-dev \
                    libxslt1-dev \
                    python3-dev \
                    python3-pip \
                    kali-linux \
                    kali-linux-top10 \
                    kali-linux-web -yqq && \
    apt-get clean

RUN wget --quiet https://netix.dl.sourceforge.net/project/wapiti/wapiti/wapiti-3.0.0/wapiti-3.0.0.tar.gz -O /tmp/wapiti.tar.gz && \
    tar xzf /tmp/wapiti.tar.gz -C /tmp/ && \
    python3 /tmp/wapiti-3.0.0/setup.py install && \
    rm /usr/bin/wapiti && \
    ln -s /usr/local/bin/wapiti /usr/bin/wapiti && \
    rm -r /tmp/wapiti.tar.gz /tmp/wapiti-3.0.0/



CMD ["bash"]

