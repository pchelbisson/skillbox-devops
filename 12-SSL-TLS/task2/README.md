## Nginx HTTPS Configuration with Self-Signed Certificates

This project demonstrates the configuration of the Nginx web server to serve content securely over HTTPS using a self-signed SSL certificate in a local laboratory environment.

## Objective

Generate a self-signed certificate/key pair and configure Nginx to enable secure (SSL/TLS) traffic.

## Workflow

### 1. Generate SSL Certificate and Key
Use OpenSSL to create a new private key (.key) and a self-signed certificate (.crt):

```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx-selfsigned.key -out nginx-selfsigned.crt

```
**Common Name:** Set this to devops.practice or your server's IP address when prompted. 

### 2. Configure Nginx
Edit the Nginx configuration file (/etc/nginx/sites-available/default) to listen on port 443 (HTTPS) and specify the certificate paths:

```nginx
server {
    listen 443 ssl;
    ssl_certificate /path/to/nginx-selfsigned.crt;
    ssl_certificate_key /path/to/nginx-selfsigned.key;
    # ... other Nginx config lines ...
}
```

### 3. Update Hosts File (Local DNS Resolution)
Ensure the browser can resolve the domain name devops.practice to the correct server IP by adding an entry to /etc/hosts:

```bash
127.0.0.1    devops.practice
```

### 4. Verification
Test Nginx configuration syntax and restart the service:

```bash
nginx -t
systemctl restart nginx

```
Navigate to https://devops.practice in a web browser. The connection will show a security warning (expected for self-signed certs) but will be operational.