# LinuxLab Troubleshooting

## Check Nginx

sudo systemctl status nginx
sudo nginx -t

## Check Cloudflare Tunnel

sudo systemctl status linuxlab-tunnel

## View tunnel logs

sudo journalctl -u linuxlab-tunnel -n 50 --no-pager

## View Nginx logs

sudo tail -n 50 /var/log/nginx/error.log
sudo tail -n 50 /var/log/nginx/access.log

## Check firewall

sudo ufw status verbose

## Test local website

curl -H "Host: linuxlab.local" http://127.0.0.1/

## Common issues

- Nginx configuration errors: run sudo nginx -t.
- Website permission errors: inspect file and directory permissions.
- Tunnel unavailable: inspect systemd logs and network connectivity.
- Old Quick Tunnel URL: inspect the latest tunnel startup logs for a new URL.

## Security

Never publish private logs, credentials, authentication tokens,
private keys, or sensitive network information.
