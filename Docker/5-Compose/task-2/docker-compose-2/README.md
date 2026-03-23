# Task 2: Multi-Container Orchestration with Flask and Redis

## Project Overview

This project demonstrates a microservice architecture using **Docker Compose**. It features a Python Flask web application integrated with a **Redis** in-memory data store to track and display the number of page visits.

## Key Features

- **Service Discovery:** The Flask application connects to the Redis service using its internal Docker network hostname (`redis`).
    
- **Data Persistence (In-Memory):** State is managed by Redis, allowing the visit counter to persist as long as the Redis container is running.
    
- **Network Isolation:** Implements a dedicated bridge network named `back-tier` to facilitate secure communication between the frontend and the database.
    
- **Dependency Management:** Uses `depends_on` to ensure the Redis service starts before the web application.
    

## Project Structure

- `app.py`: Updated Flask logic with Redis integration.
    
- `requirements.txt`: Includes `flask` and `redis` libraries.
    
- `compose.yaml`: Defines two services (`web-app`, `redis`) and the `back-tier` network.
    
- `Dockerfile`: Containerization instructions for the Python environment.
    

## How to Run

### 1. Launch the Infrastructure

Execute the following command in the project root:

Bash

```
docker compose up --build
```

Docker Compose will automatically create the `back-tier` network, pull the Redis image, build the Flask image, and link them together.

### 2. Verify the Counter

Navigate to: `http://<your-server-ip>:8000`

Refresh the page several times. You will see the **"Number of visits"** incrementing with each refresh.

## Network Analysis (Q&A)

**Q: Will the application work if the `back-tier` network is disconnected from the services in `compose.yaml`?**

**A:** No. Without the shared `back-tier` network, the `web-app` container will lose its ability to resolve the `redis` hostname. This results in a connection failure between the application and the database, causing the web server to return an error (Internal Server Error) instead of the visit count.