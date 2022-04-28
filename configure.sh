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
                        "id": "d590d760-2c08-444f-af64-bb2dd24c0db8",
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
