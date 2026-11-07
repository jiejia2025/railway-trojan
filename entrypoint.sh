#!/bin/sh
set -e
PORT="${PORT:-8080}"
PASSWORD="${TROJAN_PASSWORD:?TROJAN_PASSWORD env required}"
cat > /etc/sing-box/config.json <<JSON
{
  "log": { "level": "info", "timestamp": true },
  "inbounds": [
    {
      "type": "trojan",
      "tag": "trojan-ws-in",
      "listen": "::",
      "listen_port": ${PORT},
      "users": [ { "password": "${PASSWORD}" } ],
      "transport": { "type": "ws", "path": "/trojan" }
    }
  ],
  "outbounds": [ { "type": "direct", "tag": "direct" } ]
}
JSON
exec sing-box run -c /etc/sing-box/config.json
