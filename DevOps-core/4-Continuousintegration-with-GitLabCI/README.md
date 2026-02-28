# GitLab CI/CD Pipeline for React Application

## Project Overview
This project demonstrates a fully functional Continuous Integration (CI) pipeline for a React application, updated from legacy versions to work within a modern Docker-based environment.

---

## Requirements & Implementation
The following tasks were completed as per the assignment:
- **Repository Setup:** Migrated legacy code into a fresh repository for a clean CI/CD start.
- **Dependency Management:** Executed `yarn upgrade` to bring packages up to date and resolved critical version conflicts (Babel/ESLint) using `resolutions`.
- **Docker Executor:** Configured a local GitLab Runner using the `docker` executor with `node:20-bookworm` image.
- **Code Linting:** Integrated ESLint 9 (Flat Config) to ensure code quality and syntax standards.
- **Parallel Execution:** Optimized the pipeline by running Unit Tests and Linting simultaneously to reduce build time.

---

## Pipeline Architecture
The pipeline consists of two main stages:
1. **Install Stage:**
    - Downloads dependencies and prepares the `node_modules` folder.
    - Implements **Caching** to persist dependencies across different jobs. 
2. **Test Stage (Parallel):**
    - `run_tests:` Executes Jest suites. Uses `SKIP_PREFLIGHT_CHECK` to handle legacy versioning issues.
    - `run_lint:` Runs ESLint to check for syntax and style errors.

---

## Technical Challenges Overcome

- **Cache vs Artifacts:** Switched to local caching to avoid network bottlenecks and "Connection Reset" errors during large `node_modules` uploads.
- **Legacy Compatibility:** Resolved the "Babel version mismatch" between `react-scripts` and modern plugins using `yarn resolutions` in `package.json`.
- **Modern ESLint Migration:** Configured `eslint.config.mjs` to support modern JSX transforms and Jest globals while maintaining compatibility with older React code.