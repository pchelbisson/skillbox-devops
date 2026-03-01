# React App CI/CD Pipeline with Automated Deployment & Staging Support

This project demonstrates a robust DevOps workflow for a React application, featuring automated builds, multi-environment deployment (Production & Staging), and a smart rollback mechanism using symbolic links.

## 🚀 Key Features

- **Automated Build**: Uses Node.js 16 (Bullseye) with yarn caching for optimized performance.
    
- **Environment-Specific Config**:
    
    - **Production**: Clean build deployed to the root web directory.
        
    - **Staging**: Automated deployment to branch-specific subfolders with dynamic titles (e.g., `[branch=master]`).
        
- **Zero-Downtime Deployment**: Utilizes atomic symbolic link switching on the Nginx server.
    
- **Smart Rollback**: A custom script to revert to the previous or even "two steps back" version using nested symlinks.
    
- **Disk Space Management**: Automatically keeps only the 5 most recent deployments to save server storage.
    

## 🛠 Tech Stack

- **Frontend**: React.js
    
- **CI/CD**: GitLab CI/CD
    
- **Web Server**: Nginx (Ubuntu)
    
- **Runner**: Docker-based GitLab Runner with host volume mapping.
    

---

## 📋 Pipeline Architecture

The pipeline consists of four main stages:

### 1. Build Stage

Compiles the React application.

- **Staging** builds include a custom prefix: `REACT_APP_WEBSITE_PREFIX="[branch=$CI_COMMIT_BRANCH] "`.
    
- Artifacts are passed to the next stage via GitLab CI Cache.
    

### 2. Deploy Stage

- Copies the build folder to `/var/www/test-app/` using the commit SHA for versioning.
    
- Creates a `prev-version` symlink inside each new folder pointing to the current active version, creating a history chain.
    

### 3. Activate (Manual/Auto)

- **Staging**: Automatically updates the symlink at `/var/www/staging/$CI_COMMIT_BRANCH`.
    
- **Production**: Requires manual confirmation (`when: manual`) to update the symlink at `/var/www/html`.
    

### 4. Revert Stage

- **Revert**: Swaps the current symlink with the `prev-version` link.
    
- **Revert Two Steps**: A advanced script that traverses two levels of symlinks to recover from a double-failed deployment.
    

---

## 🔧 Nginx Configuration

To support this structure, the Nginx server is configured as follows:

Nginx

```
server {
    listen 80;
    root /var/www/html;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }

    location /staging/ {
        alias /var/www/staging/;
        autoindex on;
    }
}
```