## Docker Infrastructure Audit & Troubleshooting Case

### 🎯 Project Goal

The objective was to perform a deep-dive audit of a broken microservices stack, identify configuration bottlenecks, and restore core infrastructure services (Database & Cache) to an operational state.

### 🔍 Issues Identified & Resolved

#### 🏗 Docker Engine & Build Layer

- **Broken Image Inheritance:** Restored missing `FROM` instructions in Nginx and Redis Dockerfiles, ensuring a valid build chain.
    
- **Privilege Management:** Standardized container execution by explicitly defining `USER root` and `EXPOSE` directives for the Python-based backend.
    

#### 🎼 Orchestration (Docker Compose)

- **Syntax Integrity:** Fixed critical YAML indentation and mapping errors that prevented the stack from initializing.
    
- **Volume Mapping:** Corrected invalid string paths for `crontab` configuration, enabling persistent cron job scheduling.
    
- **Network Segmentation:** Implemented a dual-network topology (`frontend` / `backend`) to ensure traffic isolation between the web-proxy and internal data stores.
    

### 🧪 Technical Validation

Successfully restored the core data layer:

- **MySQL (db):** Up and accepting connections on port 3306.
    
- **Redis:** Fully operational with local build context.
    

---

**Key Takeaways**:

> _"During this project, I focused on infrastructure stability and network isolation. While the application layer (todo/consumers) remained outside the initial troubleshooting scope, the underlying data-link layer was fully restored and optimized for secure internal communication."_

---

**Service Status & Constraints:**

- ✅ **Database (MySQL) & Cache (Redis):** Fully operational and optimized.
    
- ⚠️ **Application Layer (Todo/Consumers):** These services remain in an `Exited` state by design. This repository focuses strictly on **infrastructure-level troubleshooting** (networking, volume mounting, Dockerfile syntax, and compose orchestration) rather than debugging internal application-specific code (uWSGI/Python logic).

**View the solution and detailed troubleshooting report here: [[Link to your Pull Request](https://github.com/pchelbisson/skillbox-devops/pull/4)]**