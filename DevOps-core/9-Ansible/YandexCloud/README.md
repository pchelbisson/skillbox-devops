# Multi-Tier ReactJS Deployment with Ansible & Terraform

This repository demonstrates a production-grade automated deployment of a ReactJS application on **Yandex Cloud** (or AWS-compatible environments). The project transitions from a monolithic Playbook structure to a modular, role-based architecture, ensuring scalability, idempotency, and clean configuration management.

## 🏗 System Architecture

The infrastructure follows a classic **Reverse Proxy** pattern:

1. **Infrastructure (Terraform)**: Provisions VPC, subnets, and Ubuntu 22.04 LTS instances.
    
2. **Application Tier (ReactJS)**: A Node.js environment managed by **PM2** for process persistence.
    
3. **Web Tier (Nginx)**: Dual Nginx instances acting as entry points, proxying traffic to the application backend.
    

---

## 🛠 Tech Stack

- **Infrastructure:** Terraform
    
- **Configuration Management:** Ansible (Roles, Handlers, Jinja2, Magic Variables)
    
- **Runtime:** Node.js 20.x, Yarn, PM2
    
- **Web Server:** Nginx (Reverse Proxy)
    
- **Cloud Provider:** Yandex Cloud
    

---

## 🚀 Project Evolution

### Phase 1: Base Deployment (`main` branch)

The initial implementation focuses on environment parity and resolving core system constraints:

- **Node.js 20 Migration**: Handling OpenSSL 3.0 compatibility using `NODE_OPTIONS="--openssl-legacy-provider"`.
    
- **Privileged Ports**: Utilizing Linux `capabilities` (`setcap`) to allow Node.js to bind to port 80 without root privileges.
    
- **Dynamic UI**: Automating the injection of the server's internal IP into the React frontend during deployment.
    

### Phase 2: Role-Based Refactoring (`feature/ansible-roles` branch)

Refactoring the codebase into professional Ansible Roles for better maintainability:

- **Role `reactapp`**: Decouples system installation (`install.yml`) from application lifecycle management (`deploy.yml`).
    
- **Role `nginx`**: Implements automated cleanup of default configurations and template-based proxy settings.
    
- **Orchestration**: Uses Ansible **Magic Variables** (`hostvars`) to allow Nginx nodes to dynamically discover the ReactJS backend IP without hardcoding.
    

---

## 🔗 Development Workflow

To see the technical transition from scripts to architectural roles, view the pending Pull Request:

- **Pull Request:** [[Link to GitHub PR](https://github.com/pchelbisson/skillbox-devops/pull/5)]
    
- **Status:** Refactoring Complete / Testing Passed.
    

---

## 🔧 Getting Started

### 1. Provision Infrastructure

Bash

```
cd terraform
terraform init
terraform apply
```

### 2. Execute Orchestration

Bash

```
cd ../ansible
ansible-playbook -i hosts site.yml
```

---

## 💡 Key Takeaways

- **Idempotency**: All roles are designed to be safe for repeated execution.
    
- **Security**: Minimal use of `sudo` for application processes through granular Linux permissions.
    
- **Scalability**: Adding more Nginx or React nodes only requires updating the `hosts` inventory; the logic remains unchanged.