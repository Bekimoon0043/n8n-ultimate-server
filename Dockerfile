FROM node:20-bookworm

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

# install useful python libraries
RUN pip3 install \
    requests \
    beautifulsoup4 \
    pandas \
    numpy \
    pillow

# install n8n
RUN npm install -g n8n

# install Postiz
RUN npm install -g postiz

ENV N8N_COMMUNITY_PACKAGES_ALLOW_TOOL_USAGE=true

WORKDIR /data

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

EXPOSE 5678

ENTRYPOINT ["/docker-entrypoint.sh"]
