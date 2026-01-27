## Firewall and information security basics
This README summarizes the practical tasks completed during the session, covering system scanning, firewall configuration, web server hardening, and database security best practices.

### Task 1. System Scanning with `rkhunter`

- **Objective:** Install and run Rootkit Hunter to identify system vulnerabilities and security issues.
- **Key Concepts & Steps:**
  - Installed `rkhunter` using `apt`.
  - Resolved the Invalid `WEB_CMD` configuration option error by modifying `/etc/rkhunter.conf`.
  - Updated the signatures (`rkhunter --update`) and created a system properties database (`rkhunter --propupd`).
- **Analysis:** Identified warnings regarding large shared memory segments (false positive) and allowed SSH root access (`PermitRootLogin yes` or `default`), which was deemed a critical vulnerability in a production environment.

### Task 2. SSH Access Blocking with `iptables`

- **Objective:** Block SSH access using `iptables` and ensure persistence after reboot.
- **Key Concepts & Steps:**
  - Used the user's specific SSH port (2222).
  - Added a `DROP` rule for the SSH port: `sudo iptables -A INPUT -p tcp --dport 2222 -j DROP`.
  - Verified the block using a second terminal session.
  - Ensured persistence across reboots by installing `iptables-persistent` and saving the rules (`netfilter-persistent save`).

### Task 3. Implementing a Whitelist Firewall Policy

- **Objective:** Implement a default-deny firewall policy, allowing only essential services (HTTP, HTTPS, SSH).
- **Key Concepts & Steps:**
  - Set a default `DROP` policy for the `INPUT` chain: `sudo iptables -P INPUT DROP`.
  - Allowed necessary ports:
    ```bash
    sudo iptables -A INPUT -p tcp --dport 2222 -j ACCEPT
    sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
    sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT
    ```
  - **Resolution:** Fixed the issue where `apt-get update` failed by implementing stateful firewall rules: `sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT`
  - Allowed loopback traffic: `sudo iptables -A INPUT -i lo -j ACCEPT`.

### Task 4. Nginx HSTS Header Configuration

- **Objective:** Implement the HSTS (HTTP Strict Transport Security) header in Nginx.
- **Key Concepts & Steps:**
  - Modified the Nginx configuration file (`/etc/nginx/sites-available/default`).
  - Added the Strict-Transport-Security header directive within the server block:
    ```bash
    add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;

    ```
  - Verified the header presence using `curl -kI https://localhost`, confirming the security enhancement.

### Task 5. Secure MySQL Installation

- **Objective:** Harden the MySQL database installation using the built-in security script.
- **Key Concepts & Steps:**
  - Executed mysql_secure_installation.
  - Accepted all security prompts: removing anonymous users, disallowing remote root login, and deleting the test database.
  - **Analysis:** Understood that default modern installations use Unix socket authentication for the root user, requiring sudo mysql for local access rather than a password (`mysql -u root -p`).