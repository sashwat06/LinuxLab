# 🚀 LinuxLab — Ubuntu Server Administration

A hands-on Linux system administration project built on a physical Ubuntu machine.

## 🌐 Overview

LinuxLab demonstrates how to configure and manage a self-hosted static website using Nginx on Ubuntu Linux and expose it externally through Cloudflare Tunnel.

## 🛠️ Technology Stack

| Technology | Purpose |
|---|---|
| Ubuntu Linux | Host operating system |
| Nginx | Web server |
| HTML | Website |
| Cloudflare Tunnel | External connectivity |
| systemd | Service management |
| UFW | Firewall |
| Git | Version control |

## ✨ Features

- Nginx web server configuration
- Static HTML website hosting
- Firewall management using UFW
- Cloudflare Quick Tunnel
- systemd service management
- Linux service monitoring and logs
- Troubleshooting documentation

## 🏗️ Architecture

```mermaid
flowchart TD
    A[Visitor Browser] --> B[Cloudflare]
    B --> C[Cloudflare Tunnel]
    C --> D[cloudflared]
    D --> E[Nginx on Ubuntu]
    E --> F[LinuxLab Website]
    G[systemd] --> D
```

## 📁 Project Structure

```text
LinuxLab/
├── docs/
│   ├── architecture.md
│   └── troubleshooting.md
├── nginx/
│   └── linuxlab.conf
├── systemd/
│   └── linuxlab-tunnel.service
├── screenshots/
├── index.html
├── .gitignore
└── README.md
```

## ⚙️ Installation and Testing

Update Ubuntu:

```bash
sudo apt update
```

Install Nginx:

```bash
sudo apt install nginx
```

Enable and start Nginx:

```bash
sudo systemctl enable --now nginx
```

Check configuration:

```bash
sudo nginx -t
```

Check service:

```bash
sudo systemctl status nginx
```

Test the local website:

```bash
curl -H "Host: linuxlab.local" http://127.0.0.1/
```

## ☁️ Cloudflare Tunnel

LinuxLab uses Cloudflare Quick Tunnel to make the local website accessible externally without router port forwarding.

Check the tunnel service:

```bash
sudo systemctl status linuxlab-tunnel
```

View tunnel logs:

```bash
sudo journalctl -u linuxlab-tunnel -n 50 --no-pager
```

**Note:** Quick Tunnel URLs are temporary and may change after a restart. This setup is intended for learning and experimentation, not production hosting.

## 🔍 Documentation

- [Architecture](docs/architecture.md)
- [Troubleshooting](docs/troubleshooting.md)

## 🔐 Security Notes

- Keep credentials, private keys and tokens out of Git.
- Never publish sensitive system logs or personal network details.
- Restrict SSH access to trusted networks.
- Understand that a public tunnel exposes the website to anyone with its URL.
- Review firewall rules before exposing services.

## 🎯 Future Improvements

- Configure a named Cloudflare Tunnel.
- Add HTTPS and a custom domain.
- Add monitoring and automated health checks.
- Improve website design.
- Add screenshots and deployment documentation.

## 👨‍💻 Author

**Sashwat Shukla**

Linux System Administration | Networking | Cloud Infrastructure Learning

