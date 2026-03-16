FROM n8nio/n8n:latest

USER root

# install system tools
RUN apt-get update && apt-get install -y \
    ffmpeg \
    python3 \
    python3-pip \
    git \
    curl \
    jq \
    imagemagick \
    ghostscript \
    tesseract-ocr \
    chromium \
    fonts-freefont-ttf \
    ca-certificates \
    bash \
    && rm -rf /var/lib/apt/lists/*

# install yt-dlp
RUN pip3 install yt-dlp

# install playwright
RUN pip3 install playwright && playwright install chromium

# install python libraries
RUN pip3 install \
    requests \
    beautifulsoup4 \
    pandas \
    numpy \
    pillow

# install Postiz
RUN npm install -g postiz

# install community nodes
RUN npm install -g \
    n8n-nodes-ffmpeg \
    n8n-nodes-python \
    n8n-nodes-base64

ENV N8N_COMMUNITY_PACKAGES_ALLOW_TOOL_USAGE=true

WORKDIR /data

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

USER node

ENTRYPOINT ["/docker-entrypoint.sh"]
