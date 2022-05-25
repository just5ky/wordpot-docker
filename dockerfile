FROM alpine

# Include dist
COPY requirements.txt /root/dist/

# Install packages
RUN apk -U --no-cache add \
    build-base \
    git \
    libcap \
    py3-click \
    py3-flask \
    py3-itsdangerous \
    py3-jinja2 \
    py3-markupsafe \
    py3-pip \
    py3-werkzeug \
    python3 \
    python3-dev

# Install wordpot from GitHub and setup
RUN    mkdir -p /opt && \
    mkdir -p /log && touch /log/wordpot.log && \
    cd /opt/ && \
    git clone https://github.com/Will-777/wordpot2 && \
    cd wordpot2 && \
    git checkout e93a2e00d84d280b0acd58ba6889b4bee8a6e4d2 && \
    cp /root/dist/requirements.txt . && \
    pip3 install -r requirements.txt 

# Clean up
RUN    apk del --purge build-base \
    git \
    python3-dev && \
    rm -rf /root/* /var/cache/apk/* /opt/wordpot2/.git

# Start wordpot
STOPSIGNAL SIGINT
WORKDIR /opt/wordpot2
COPY log.py .

CMD ["/usr/bin/python3","log.py"]
