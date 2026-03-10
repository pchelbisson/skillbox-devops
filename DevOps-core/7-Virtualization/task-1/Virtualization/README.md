# React Application Deployment via Ansible & VirtualBox

This project automates the deployment of a React-based web application onto an Ubuntu Server 22.04 instance running within VirtualBox. The deployment process is fully handled by Ansible.

## Project Overview

The objective of this task was to configure a virtual environment, set up networking, and use Infrastructure as Code (IaC) principles to deploy a frontend application.

### Tech Stack
* **Hypervisor:** VirtualBox (Ubuntu 22.04 ISO)
* **Automation:** Ansible
* **Web Server:** Nginx
* **Runtime:** Node.js 20.x & Yarn
* **Frontend:** React.js

## Infrastructure Configuration

1. **Virtual Machine:** Configured with two network adapters:
   - **Host-Only Adapter:** Assigned static IP `10.10.10.10` for host-to-guest communication.
   - **NAT Adapter:** Provides internet access for downloading dependencies (NodeSource, Yarn, Git).
2. **Environment:** Ubuntu 22.04 LTS.

## Ansible Playbook Features

The `reactjs.yaml` playbook performs the following operations:
* **System Preparation:** Updates APT cache and ensures necessary tools (`curl`, `git`, `nginx`) are installed.
* **Node.js Environment:** Configures NodeSource repository for Node.js 20.x.
* **Clean Deployment:** Implements a release-based structure in `/var/www/releases/` to ensure atomic deployments.
* **React Build:** - Patches `package.json` for Babel compatibility.
    - Executes `yarn install` and `yarn build`.
    - Uses `NODE_OPTIONS="--openssl-legacy-provider"` to support older React scripts on modern OpenSSL versions.
* **Dynamic Content:** Automatically replaces placeholder text in `App.js` with the instance's IP address.
* **Nginx Setup:** Configures a symlink to the latest build and ensures correct permissions for `www-data`.

## How to Run

Since the deployment was managed from within the VM environment (due to WSL2/VirtualBox network isolation), the playbook was executed locally:

```bash
ansible-playbook reactjs.yaml -b -i "localhost," -c local -K
```

## Verification

To verify the deployment from the host machine (Windows/WSL2):

1. Site content was validated using curl -I http://localhost (HTTP 200 OK).

2. Due to specific routing restrictions between WSL2 and VirtualBox, an SSH tunnel was used for final verification:
```bash 
ssh -L 8080:localhost:80 pchelbisson@10.10.10.10
```
3. Accessing `http://localhost:8080` confirms the application is running and displaying the correct prefix: "Andrey Lagutin".