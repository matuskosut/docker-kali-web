from kalilinux/kali-linux-docker

ENV DEBIAN_FRONTEND noninteractive
ENV RUNLEVEL 1
RUN apt-get update && \
    apt-get -yqq upgrade && \
    apt-get -yqq install strace host whois nmap telnet conntrack iftop httpie man lynx && \
    apt-get -yqq install python3-venv libxml2 libxml2-dev libz-dev libxslt1-dev python3-dev python3-pip && \
    apt-get -yqq install kali-linux kali-linux-top10 kali-linux-web

RUN wget --quiet https://netix.dl.sourceforge.net/project/wapiti/wapiti/wapiti-3.0.0/wapiti-3.0.0.tar.gz -O /tmp/wapiti.tar.gz && \
    tar xzf /tmp/wapiti.tar.gz -C /tmp/ && \
    cd /tmp/wapiti-3.0.0/ && \
    python3 setup.py install && \
    rm /usr/bin/wapiti && \
    ln -s /usr/local/bin/wapiti /usr/bin/wapiti && \
    rm -r /tmp/wapiti.tar.gz /tmp/wapiti-3.0.0/



CMD ["bash"]

