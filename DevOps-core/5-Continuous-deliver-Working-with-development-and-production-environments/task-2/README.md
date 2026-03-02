# Static Site Blue-Green Deployment with GitLab CI/CD

This project demonstrates a professional **Blue-Green deployment** strategy for static websites using a custom GitLab Runner and symbolic link switching. It ensures **Zero Downtime** and provides a reliable one-click rollback mechanism.

## 🌟 Features

- **Atomic Deployment**: Uses `ln -sfn` to switch between versions instantaneously, preventing "broken state" during file copying.
    
- **Automated Release Management**: Each deployment is stored in a unique folder named after the commit SHA.
    
- **Sanity Testing**: A pre-switch check ensures that critical files (like `index.html`) exist before traffic is routed to the new version.
    
- **One-Click Rollback**: A manual CI/CD job to instantly revert the `current` symlink to the previous working version.
    
- **Storage Optimization**: Automated cleanup script keeps only the 5 most recent releases to save disk space.
    

## 🏗 Architecture

The deployment follows a structured directory pattern on the production server:

Plaintext

```
/var/www/static-site/
├── current -> ./releases/abc1234  # Active version (Symlink)
└── releases/
    ├── abc1234/                   # Current Release
    ├── def5678/                   # Previous Release
    └── ...
```

## 🛠 CI/CD Pipeline Stages

### 1. Deploy

- Creates a new directory in `releases/` using `$CI_COMMIT_SHORT_SHA`.
    
- Copies the static assets to the new directory.
    
- **Sanity Check**: Validates the presence of `index.html`.
    
- **Atomic Switch**: Updates the `current` symbolic link to point to the new release.
    
- **Cleanup**: Removes old releases, keeping only the 5 latest ones.
    

### 2. Rollback (Manual)

- Identifies the previous release folder using timestamp sorting.
    
- Minstantly repoints the `current` symlink to the previous version.
    

---

## 🔧 Server Setup & Security

To maintain the **Principle of Least Privilege**, the runner is configured with restricted permissions:

1. **User Access**: The GitLab Runner operates as a non-root user.
    
2. **Permissions**:
    
    Bash
    
    ```
    sudo usermod -aG www-data gitlab-runner
    sudo chown -R gitlab-runner:www-data /var/www/static-site
    sudo chmod -R 775 /var/www/static-site
    ```
    
3. **Nginx Configuration**: The web server is pointed to the symbolic link: `root /var/www/static-site/current;`
    

---

## 📖 How to Use

1. **Push to Main**: Any push to the `main` branch triggers an automatic deployment.
    
2. **Verify**: Check the website live.
    
3. **Emergency Rollback**: If an issue is detected, go to GitLab -> CI/CD -> Pipelines and trigger the manual `rollback_job`.