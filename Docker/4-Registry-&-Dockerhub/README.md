# Docker Registry Management and Image Distribution

## Project Overview

This project demonstrates the complete workflow of managing Docker images across different environments. It covers setting up a private **Local Docker Registry**, creating custom images, and distributing them to both local and global (**Docker Hub**) repositories.

## Key Objectives:

1. **Local Infrastructure:** Deployed a private Docker Registry (v2) as a local container.
    
2. **Custom Image Development:** Built a specialized Python-based image with custom metadata and entry point logic.
    
3. **Image Tagging & Logistics:** Mastered the versioning and naming conventions required to route images to different registries.
    
4. **Global Distribution:** Published the verified image to a public repository on Docker Hub.
    

## Technical Implementation:

### 1. Local Registry Setup

A local registry was initialized to handle private image storage:

Bash

```
docker run -d -p 5000:5000 --name local-registry registry:2
```

### 2. Custom Dockerfile

The image was built using a lightweight Python base:

Dockerfile

```
FROM python:3.9-slim
LABEL maintainer="andrey_lagutin"
CMD ["python", "-c", "print('Hello from Andrey Lagutin custom image!')"]
```

### 3. Distribution Workflow

The image was tagged and pushed using the following logic:

- **To Local Registry:** `localhost:5000/my-custom-python:v1.0`
    
- **To Docker Hub:** `<username>/my-custom-python:v1.0`
    

## Troubleshooting & Key Learnings:

- **Tagging Significance:** Learned that the image name prefix (e.g., `localhost:5000/`) is what dictates the destination registry during a `docker push` operation.
    
- **Authentication:** Managed secure login sessions using `docker login` for public distribution.
    
- **Registry Benefits:** Understood how local registries improve deployment speed and security within isolated corporate networks.