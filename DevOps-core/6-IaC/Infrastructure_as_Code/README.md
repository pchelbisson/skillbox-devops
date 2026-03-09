# React App Deployment with Terraform & Ansible

This repository contains an automated pipeline for deploying a React.js application to a Yandex Cloud instance. The project demonstrates the **Infrastructure as Code (IaC)** approach, using Terraform for provisioning and Ansible for configuration management.

## 🛠 Tech Stack

- **Cloud Provider:** Yandex Cloud
    
- **Infrastructure:** Terraform
    
- **Configuration:** Ansible
    
- **Frontend:** React.js (Node.js 20.x)
    
- **Web Server:** Nginx
    

---

## 🚀 Key Features & Solutions

During the development process, several complex technical challenges were resolved:

- **Legacy OpenSSL Support:** Resolved `ERR_OSSL_EVP_UNSUPPORTED` error on Ubuntu 22.04 by implementing the `--openssl-legacy-provider` flag.
    
- **Dependency Management:** Fixed Babel version conflicts using Yarn resolutions and forced package updates.
    
- **Automated Deployment:** Created a zero-downtime-like release structure with timestamped directories and symlinking.
    

---

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

1. **Terraform** (v1.5+)
    
2. **Ansible** (v2.10+)
    
3. **YC CLI** (configured with your cloud credentials)
    
4. **SSH Key Pair** (Ed25519 recommended)
    

---

## 🔧 Installation & Deployment

### 1. Infrastructure Provisioning

Navigate to the Terraform directory and initialize the resources:

Bash

```
cd TerraformOneServer
terraform init
terraform apply -auto-approve
```

### 2. Configure Ansible Inventory

Update the `hosts` file with the public IP address of your new instance:

Ini, TOML

```
[frontend_servers]
reactjs_1 ansible_host=<YOUR_INSTANCE_IP> ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519
```

### 3. Run the Playbook

Deploy the application using the following command:

Bash

```
ansible-playbook -b reactjs.yaml -vv
```

---

## 🌐 Verification

Once the playbook finishes successfully:

1. Open your browser and navigate to `http://<YOUR_INSTANCE_IP>`.
    
2. Verify that the website displays the custom header with the **Prefix** (e.g., "Andrey Lagutin").
    
3. Ensure the instance IP is correctly displayed within the application UI.
    

---

## 🧹 Cleanup

To avoid unnecessary cloud costs, destroy the resources after testing:

Bash

```
terraform destroy -auto-approve
```

---

## 📝 Lessons Learned

- Managing Node.js versioning and dependencies in modern Linux environments (Ubuntu 22.04).
    
- Handling SSH authentication and agent forwarding for automated tasks.
    
- Configuring Nginx as a reverse proxy for Single Page Applications (SPA).