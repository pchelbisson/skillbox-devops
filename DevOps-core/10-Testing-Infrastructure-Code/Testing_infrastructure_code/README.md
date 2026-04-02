# Infrastructure Testing: Docker & Testinfra Integration

This repository demonstrates the implementation of **Infrastructure-as-Code (IaC) testing** within a Docker build pipeline. By integrating `pytest-testinfra` directly into the `Dockerfile`, we ensure that only validated and correctly configured images are built and tagged.

## 🏗 Project Architecture

The project is based on a **PHP-FPM & Nginx** stack running on **Alpine Linux 3.11**. The key highlight is the **Build-Time Testing** layer, which prevents the creation of faulty containers.

1. **Base Image**: Alpine Linux (Lightweight footprint).
    
2. **Testing Tool**: `testinfra` (Python-based infrastructure verification).
    
3. **Process Management**: `supervisord` for handling multiple processes (Nginx & PHP-FPM).
    

---

## 🛠 Tech Stack

- **Containerization:** Docker
    
- **Testing Framework:** Pytest, Testinfra
    
- **Language:** Python 3.8
    
- **Web Server:** Nginx 1.18
    
- **Runtime:** PHP 7.4, FPM
    

---

## 🚀 Key Features & Implementation

### 1. Build-Time Infrastructure Validation

Unlike post-deployment testing, this project runs tests **during the `docker build` process**. If any system requirement (e.g., Nginx installation or OS version) fails, the build exits with an error, preventing broken images from reaching production.

### 2. Automated Test Suite (`test.py`)

The test suite verifies the "ground truth" of the container:

- **OS Verification**: Ensures the distribution is strictly Alpine Linux.
    
- **Service Presence**: Confirms Nginx is installed and available in the system `$PATH`.
    
- **Version Control**: Validates that the Nginx binary is functional and returns the expected version string.
    

### 3. Optimized Docker Layering

The `Dockerfile` is organized to follow Docker best practices:

- **Layer Caching**: Heavy dependencies (Python, Pip) are installed early.
    
- **Test Placement**: Tests are executed immediately after system package installation but before switching to a non-root user (`nobody`), ensuring sufficient permissions for system-level checks.
    

---

## 🔗 Development Workflow

This project follows a professional Git workflow. You can view the refactoring process and the integration of the testing suite in the following Pull Request:

- **Feature Branch:** `feature/infrastructure-testing`
    
- **Pull Request:** [[Link to GitHub PR](https://github.com/pchelbisson/skillbox-devops/pull/6)]
    
- **Status:** Merged / Verified.
    

---

## 🔧 Usage

### Build and Test

To trigger the automated test suite during the build process:

Bash

```
docker build . -t skillbox:skillbox
```

### Run the Validated Container

Bash

```
docker run -d -p 8080:8080 --name web-app skillbox:skillbox
```

Access the application at `http://localhost:8080`.

---

### 💡 DevOps Insights from this Project

- **Shift-Left Testing**: Moving infrastructure tests earlier in the development lifecycle (during image build) reduces debugging time in staging/production.
    
- **Container Integrity**: Demonstrated how to handle specific Alpine Linux repository constraints and binary paths.
    
- **Clean Logs**: Managed `pytest` output within Docker logs for clear visibility of passed/failed infrastructure requirements.