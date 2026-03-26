# Enterprise-Grade Infrastructure Stack: OpenLDAP, GitLab & Rocket.Chat Integration

## 📋 Overview

This repository contains a production-ready Dockerized infrastructure designed for centralized identity management and collaboration. The project demonstrates a seamless integration of **LDAP-based Authentication (SSO-like)** across a DevOps toolchain, focusing on resource optimization and secure service communication.

## 🛠 Tech Stack

- **Identity Management:** OpenLDAP, phpLDAPadmin
    
- **VCS & CI/CD:** GitLab CE (Customized for low-resource environments)
    
- **Collaboration:** Rocket.Chat
    
- **Database:** MongoDB (ReplicaSet-ready)
    
- **Infrastructure:** Docker, Docker Compose, Ubuntu Server
    

---

## 🚀 Key Engineering Challenges & Solutions

### 1. GitLab Resource Optimization (Performance Tuning)

Standard GitLab Omnibus installations require 4GB+ RAM. To ensure stability on a constrained host (2GB/4GB), I implemented several **under-the-hood optimizations** in `gitlab.rb`:

- **Memory Footprint Reduction:** Limited Puma worker processes and reduced Sidekiq concurrency.
    
- **Component Pruning:** Disabled non-essential services like Prometheus and monitoring exporters to save ~1GB of RAM.
    
- **Health Monitoring:** Implemented custom health checks to ensure service availability during the long bootstrap process.
    

### 2. Advanced LDAP Integration & Troubleshooting

Integrating disparate services with OpenLDAP required deep-diving into **LDAP Filters and Attribute Mapping**:

- **Rocket.Chat Auth Flow:** Resolved a critical `400 Bad Request` error by debugging the REST API response and correcting the `Search Scope` syntax from `Subtree` to `sub`.
    
- **Schema Mapping:** Synchronized LDAP attributes (`uid`, `cn`, `mail`) to ensure seamless profile creation in both GitLab and Rocket.Chat.
    
- **Security:** Configured Bind DN authentication and bypassed unverified email 2FA for initial LDAP sync to streamline the onboarding flow.
    

### 3. Secure Remote Management

- Leveraged **SSH Tunneling (L-forwarding)** to securely access management interfaces (`phpLDAPadmin`, `GitLab`) without exposing sensitive ports to the public internet.
    

---

## 🏗 Deployment Architecture

The stack is orchestrated using a custom `compose.yaml` with a dedicated bridge network.

Bash

```
# Deploy the entire stack
docker-compose up -d

# Verify service health
docker-compose ps
```

### Infrastructure Components:

|**Service**|**Role**|**Port**|
|---|---|---|
|`ldap`|Core Directory Server|389, 636|
|`gitlab`|SCM & CI/CD Platform|8080 (Mapped to 80)|
|`rocketchat`|Real-time Communication|3000|
|`mongodb`|Persistent Data Store|27017|# Enterprise-Grade Infrastructure Stack: OpenLDAP, GitLab & Rocket.Chat Integration

## 📋 Overview

This repository contains a production-ready Dockerized infrastructure designed for centralized identity management and collaboration. The project demonstrates a seamless integration of **LDAP-based Authentication (SSO-like)** across a DevOps toolchain, focusing on resource optimization and secure service communication.

## 🛠 Tech Stack

- **Identity Management:** OpenLDAP, phpLDAPadmin
    
- **VCS & CI/CD:** GitLab CE (Customized for low-resource environments)
    
- **Collaboration:** Rocket.Chat
    
- **Database:** MongoDB (ReplicaSet-ready)
    
- **Infrastructure:** Docker, Docker Compose, Ubuntu Server
    

---

## 🚀 Key Engineering Challenges & Solutions

### 1. GitLab Resource Optimization (Performance Tuning)

Standard GitLab Omnibus installations require 4GB+ RAM. To ensure stability on a constrained host (2GB/4GB), I implemented several **under-the-hood optimizations** in `gitlab.rb`:

- **Memory Footprint Reduction:** Limited Puma worker processes and reduced Sidekiq concurrency.
    
- **Component Pruning:** Disabled non-essential services like Prometheus and monitoring exporters to save ~1GB of RAM.
    
- **Health Monitoring:** Implemented custom health checks to ensure service availability during the long bootstrap process.
    

### 2. Advanced LDAP Integration & Troubleshooting

Integrating disparate services with OpenLDAP required deep-diving into **LDAP Filters and Attribute Mapping**:

- **Rocket.Chat Auth Flow:** Resolved a critical `400 Bad Request` error by debugging the REST API response and correcting the `Search Scope` syntax from `Subtree` to `sub`.
    
- **Schema Mapping:** Synchronized LDAP attributes (`uid`, `cn`, `mail`) to ensure seamless profile creation in both GitLab and Rocket.Chat.
    
- **Security:** Configured Bind DN authentication and bypassed unverified email 2FA for initial LDAP sync to streamline the onboarding flow.
    

### 3. Secure Remote Management

- Leveraged **SSH Tunneling (L-forwarding)** to securely access management interfaces (`phpLDAPadmin`, `GitLab`) without exposing sensitive ports to the public internet.
    

---

## 🏗 Deployment Architecture

The stack is orchestrated using a custom `compose.yaml` with a dedicated bridge network.

Bash

```
# Deploy the entire stack
docker-compose up -d

# Verify service health
docker-compose ps
```

### Infrastructure Components:

|**Service**|**Role**|**Port**|
|---|---|---|
|`ldap`|Core Directory Server|389, 636|
|`gitlab`|SCM & CI/CD Platform|8080 (Mapped to 80)|
|`rocketchat`|Real-time Communication|3000|
|`mongodb`|Persistent Data Store|27017|

---

## 📈 Future Scalability (Roadmap)

- [ ] Implement **Nginx Reverse Proxy** with Let's Encrypt for SSL termination.
    
- [ ] Integrate **HashiCorp Vault** for sensitive credential management (moving away from `.env` files).
    
- [ ] Add **ELK Stack** for centralized log management of the container cluster.
    

---

**Developed by:** Andrey Lagutin

**Role:** DevOps Engineer

**Focus:** Infrastructure Automation | CI/CD | System Integration


---

## 📈 Future Scalability (Roadmap)

- [ ] Implement **Nginx Reverse Proxy** with Let's Encrypt for SSL termination.
    
- [ ] Integrate **HashiCorp Vault** for sensitive credential management (moving away from `.env` files).
    
- [ ] Add **ELK Stack** for centralized log management of the container cluster.
    

---

**Developed by:** Andrey Lagutin

**Role:** DevOps Engineer

**Focus:** Infrastructure Automation | CI/CD | System Integration
