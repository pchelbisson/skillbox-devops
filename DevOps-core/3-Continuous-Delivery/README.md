# CI/CD Static Website Deployment & Archiving

## Project Overview
This project demonstrates a basic Continuous Delivery (CD) pipeline using GitLab CI. The goal was to automate the deployment of a static website to an Nginx web server and provide a downloadable archive of the application on the same server.

## Objectives
*   Automate web content updates on a remote/local server.
*   Implement an artifact-based build process.
*   Ensure the application is archived and accessible for download via a direct link.

## Tech Stack
*   **CI/CD:** GitLab CI/CD
*   **Web Server:** Nginx
*   **Environment:** Ubuntu (VirtualBox VM)
*   **Tools:** Tar, Shell Executor

## Pipeline Structure
The pipeline consists of two main stages:

### 1. Build Stage (`build-job`)
*   Compresses the source files from `Introduction_to_CD/html` into a `archive.tar.gz` file.
*   Defines the archive as a GitLab artifact for persistence between jobs.

### 2. Deploy Stage (`deploy-job`)
*   Transfers the archive to the server's web root (`/var/www/html/`).
*   Extracts the content to update the live website automatically.
*   Keeps the `.tar.gz` file in the web root, making it available for download at `http://<server-ip>/archive.tar.gz`.

## Server Configuration Highlights
To allow the GitLab Runner to deploy files without permission errors, the following steps were taken:
1.  **Nginx Setup:** Installed and configured to serve `/var/www/html`.
2.  **Permissions:** Added the `gitlab-runner` user to the `www-data` (or equivalent) group.
3.  **Write Access:** Granted group write permissions to the web root: `chmod g+w /var/www/html`.

## How to Verify
1.  Visit `http://localhost` (or server IP) to see the updated web page.
2.  Append `/archive.tar.gz` to the URL to download the application archive.
