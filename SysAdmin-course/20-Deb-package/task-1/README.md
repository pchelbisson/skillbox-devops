# Nginx WordPress Configuration DEB Package
### Overview
This repository contains a DEB package (nginx-wp-config) that installs a WordPress Nginx configuration file into /etc/nginx/conf.d/ during package installation and removes it upon package purging.

---

### Package Details
* Package Name: nginx-wp-config
* Version: 1.0-1
* Architecture: all
* Maintainer: pchelbisson
* Configuration File: wordpress.conf

---

### Installation
To install the package:
```bash
sudo dpkg -i nginx-wp-config_1.0-1_all.deb
```
---

### Post-Installation Notes
After installation, the file `wordpress.conf` will be placed in `/etc/nginx/conf.d/`. If the default Nginx configuration conflicts, you may need to disable or remove the default site:
```bash
sudo rm /etc/nginx/sites-enabled/default
sudo nginx -t
sudo systemctl reload nginx
```
---

### Removal
To completely remove the package and its configuration:

```bash
sudo dpkg -P nginx-wp-config
```