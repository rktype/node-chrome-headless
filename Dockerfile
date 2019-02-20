FROM debian:stable-slim

# Needed libraries
RUN apt-get update \
    && apt-get install -y \
        curl \
        gnupg \
        wget \
        gcc \
        g++ \
        make \
    && rm -rf /var/lib/apt/lists/*

# Install Node 10
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -  \
    && apt-get update \
    && apt-get install -y \
        nodejs \
    && npm i -g npm@6 \
    && rm -rf /var/lib/apt/lists/*

# Install Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list \
    && apt-get update \
    && apt-get install -y \
        google-chrome-stable \
        procps \
        xvfb\
    && rm -rf /var/lib/apt/lists/*

RUN useradd -u 1000 -m node



