#!/bin/sh
# V2Ray new configuration
cat <<-EOF > /etc/xray/config.json
{
    "inbounds": [
        {
            "port": 3333,
            "protocol": "vmess",
            "settings": {
                "clients": [
                    {
                        "id": "36fe1bf2-0f14-43a7-a0af-9ef6de497842",
                        "security": "chacha20-poly1305",
                        "alterId": 0
                    }
                ],
                "disableInsecureEncryption": true
            },
            "streamSettings": {
                "network": "ws"
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom"
        }
    ]
}
EOF
# Run V2Ray
/usr/bin/xray/xray -config=/etc/xray/config.json
