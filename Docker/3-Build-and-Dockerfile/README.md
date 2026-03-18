# Multi-Stage Dockerization of a React Application

## Project Overview

This project demonstrates the process of creating a production-ready Docker image for a React application using the **Multi-Stage Build** pattern. The goal was to minimize the final image size and ensure high performance by serving static assets through an optimized **Nginx** server.

## Key Features:

1. **Multi-Stage Build:** - **Stage 1 (Build):** Uses `node:18-alpine` to install dependencies and compile the React source code.
    
    - **Stage 2 (Production):** Uses `nginx:stable-alpine` to serve only the compiled static files.
        
2. **Optimization:** - Reduced the final image size from ~1GB to approximately **94MB**.
    
    - Used `.dockerignore` to prevent unnecessary files (like `node_modules` or local logs) from entering the build context.
        
3. **Custom Nginx Configuration:** Implemented `myapp_nginx.conf` to handle client-side routing correctly (React Router support).
    

## Project Structure:

- `Dockerfile`: Instructions for the two-stage build process.
    
- `.dockerignore`: Exclusion list for Docker build context.
    
- `myapp_nginx.conf`: Custom Nginx server block configuration.
    
- `src/`: React application source code.
    

## How to Build and Run:

### 1. Build the Image

To build the Docker image with the tag `v1.0`, run:

Bash

```
docker build -t my-react-app:v1.0 .
```

### 2. Run the Container

To start the container and map it to port `8081` on the host machine:

Bash

```
docker run -d --name my-react-container -p 8081:80 my-react-app:v1.0
```

### 3. Verification

Access the application by navigating to: `http://<your-server-ip>:8081`

## Troubleshooting & Notes:

- **BuildKit:** The build was performed using the modern Docker BuildKit engine, providing parallel execution of stages.
    
- **Network:** Port `8081` was chosen to avoid conflicts with existing services on the host machine.
    
- **Efficiency:** By copying only the `/app/build` directory from the first stage, we ensured that no development tools or source code are present in the production environment, enhancing security and portability.