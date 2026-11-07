FROM ghcr.io/sagernet/sing-box:latest
COPY entrypoint.sh /entrypoint.sh
RUN mkdir -p /etc/sing-box && chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
