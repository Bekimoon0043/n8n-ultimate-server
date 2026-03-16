FROM n8nio/n8n:latest

USER root

# install system tools
RUN apk update && apk add --no-cache \
    ffmpeg \
    python3 \
    py3-pip \
    git \
    curl \
    jq \
    imagemagick \
    ghostscript \
    tesseract-ocr \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    bash \
    nodejs \
    npm

# install yt-dlp
RUN pip3 install --no-cache-dir yt-dlp

# install playwright for scraping
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

# allow community nodes
ENV N8N_COMMUNITY_PACKAGES_ALLOW_TOOL_USAGE=true

WORKDIR /data

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

USER node

ENTRYPOINT ["/docker-entrypoint.sh"]
