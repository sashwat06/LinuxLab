# LinuxLab Architecture

## Overview

LinuxLab is a self-hosted static website running on a physical Ubuntu Linux machine.

## Request Flow

1. A visitor opens the public Cloudflare Quick Tunnel URL.
2. Cloudflare receives the HTTPS request.
3. The Cloudflare Tunnel forwards the request to the local cloudflared process.
4. cloudflared forwards the request to Nginx on localhost port 80.
5. Nginx serves index.html from /var/www/linuxlab.

## Components

| Component | Responsibility |
|---|---|
| Ubuntu | Host operating system |
| Nginx | Web server |
| cloudflared | Outbound tunnel connection |
| systemd | Service management |
| UFW | Host firewall |
| HTML | Website content |

## Important Notes

- Quick Tunnel URLs are temporary and may change.
- The tunnel avoids requiring inbound router port forwarding.
- The website is publicly accessible to anyone who knows the URL.
- This is a learning environment, not production hosting.
