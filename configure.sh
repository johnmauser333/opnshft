#!/bin/sh
# V2Ray new configuration
cat <<-EOF > /etc/xray/config.json
{
    "inbounds": [
        {
            "tag": "in_tomcat",
            "port": 3737,
            "protocol": "dokodemo-door",
            "settings": {
                "address": "127.0.0.1",
                "port": 8080,
                "network": "tcp"
            }
        },
        {
            "tag": "in_interconn",
            "port": 3333,
            "protocol": "vmess",
            "settings": {
                "clients": [
                    {
                        "id": "4e87136b-ee03-4c23-b567-48c651cf3707",
                        "alterId": 0,
                        "security": "chacha20-poly1305"
                    }
                ]
            },
            "streamSettings": {
              "network": "ws"
            }
        }
    ],
    "reverse": {
        "portals": [
            {
                "tag": "portal",
                "domain": "google.com"
            }
        ]
    },
    "routing": {
        "rules": [
            {
                "type": "field",
                "inboundTag": [
                    "in_tomcat"
                ],
                "outboundTag": "portal"
            },
            {
                "type": "field",
                "inboundTag": [
                    "in_interconn"
                ],
                "outboundTag": "portal"
            }
        ]
    }
}
EOF
# Run V2Ray
/usr/bin/xray/xray -config=/etc/xray/config.json
